import React, { useEffect, useState } from "react";
import { DataGrid } from "@mui/x-data-grid";
import Avatar from "@mui/material/Avatar";
import { Link } from "react-router-dom";
import {
  Alert,
  Button,
  CircularProgress,
  IconButton,
  Snackbar,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import ShowSingle from "./ShowSingle";

const columns = [
  { field: "id", headerName: "ID", width: 50 },
  { field: "title", headerName: "Title", width: 250 },
  {
    field: "location",
    headerName: "Location",
    width: 250,
  },
  {
    field: "judges",
    headerName: "Judges",
    width: 90,
  },
  {
    field: "image",
    headerName: "Image",
    width: 110,
    renderCell: () => {
      return (
        <div className="cellWithImg">
          <Avatar
            className="cellImg"
            src="https://picsum.photos/50"
            alt="avatar"
          />
        </div>
      );
    },
  },
  { field: "date", headerName: "Date", width: 130 },
  { field: "council", headerName: "Cat Council", width: 200 },
  { field: "ticket_price", headerName: "Price", width: 70 },
  { field: "ticket_count", headerName: "Tickets", width: 70 },
  { field: "email", headerName: "Created By", width: 180 },
];

export default function ShowsDataTable() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [status, setStatus] = useState("");
  const [error, setError] = useState("");
  const [warning, setWarning] = useState();
  const [severity, setSeverity] = useState("success");
  const [open, setOpen] = useState(false);

  async function handleDelete(id) {
    const res = await fetch(`https://proj2-api.herokuapp.com/api/show/delete/${id}`, {
      method: "delete",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        accessToken: localStorage.getItem("accessToken"),
      },
    });
    const data = await res.json();
    if (data.status) setStatus(data.status);
    if (data.warning) setSeverity("warning");
    if (data.warning) setWarning(data.warning);
    if (data.error) setError(data.error);
    if (data.error) setSeverity("error");
  }

  useEffect(() => {
    setLoading(true);
    fetch("https://proj2-api.herokuapp.com/api/shows", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        accessToken: localStorage.getItem("accessToken"),
      },
    })
      .then((res) => res.json())
      .then((data) => {
        setRows(data.results);
        setStatus(data.status);
        handleClick();
      })
      .catch((err) => {
        setError(err);
        setRows(null);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  const actionColumn = [
    {
      field: "action",
      headerName: "Action",
      width: 200,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <>
              <Link to={`/shows/${params.row.id}`} element={<ShowSingle />}>
                <div className="viewButton">View</div>
              </Link>
            </>
            <>
              <div
                className="deleteButton"
                onClick={() => {
                  handleDelete(params.row.id);
                }}
              >
                Delete
              </div>
            </>
          </div>
        );
      },
    },
  ];

  const handleClick = () => {
    setOpen(true);
  };

  const handleClose = (event, reason) => {
    if (reason === "clickaway") {
      return;
    }

    setOpen(false);
  };

  const action = (
    <React.Fragment>
      <Button color="secondary" size="small" onClick={handleClose}>
        UNDO
      </Button>
      <IconButton
        size="small"
        aria-label="close"
        color="inherit"
        onClick={handleClose}
      >
        <CloseIcon fontSize="small" />
      </IconButton>
    </React.Fragment>
  );

  return (
    <div style={{ height: 400, width: "100%" }} className="datatable">
      <div className="datatableTitle">
        Add New Show
        <a href="/shows/new">Add Show</a>
      </div>
      <div className="spinner">
        {loading && (
          <div>
            <CircularProgress
              color="success"
              className="iconSpinner"
              size={400}
            />
          </div>
        )}
        {error && (
          <div>{`There is a problem fetching the post data - ${error}`}</div>
        )}
      </div>
      <DataGrid
        rows={rows}
        columns={columns.concat(actionColumn)}
        pageSize={5}
        rowsPerPageOptions={[5]}
        checkboxSelection
      />
      <Snackbar open={open} autoHideDuration={6000} onClose={handleClose}>
        <Alert onClose={handleClose} severity={severity} sx={{ width: "100%" }}>
          {[status, warning, error]}
        </Alert>
      </Snackbar>
    </div>
  );
}
