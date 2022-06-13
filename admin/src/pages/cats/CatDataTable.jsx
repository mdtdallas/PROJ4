import React, { useEffect, useState } from "react";
import { DataGrid, GridCloseIcon } from "@mui/x-data-grid";
import Avatar from "@mui/material/Avatar";
import { Link } from "react-router-dom";
import Cat from "./Cat";
import { Alert, Button, CircularProgress, IconButton, Snackbar } from "@mui/material";

const columns = [
  { field: "id", headerName: "ID", width: 70 },
  { field: "name", headerName: "Name", width: 130 },
  {
    field: "breed",
    headerName: "Breed",
    width: 170,
  },
  {
    field: "photo_path",
    headerName: "Photo",
    width: 90,
  },
  {
    field: "age",
    headerName: "Judges",
    type: "number",
    width: 110,
  },
  {
    field: "image",
    headerName: "Image",
    width: 90,
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
  { field: "breeder", headerName: "Breeder", width: 130 },
  { field: "email", headerName: "User", width: 230 },
];

export default function CatDataTable() {
  const [rows, setRows] = useState([]);
  const [error, setError] = useState('');
  const [status, setStatus] = useState("");
  const [warning, setWarning] = useState();
  const [severity, setSeverity] = useState("success");
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true)
    fetch("https://proj2-api.herokuapp.com/api/cats", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        accessToken: localStorage.getItem("accessToken"),
      },
    })
      .then((res) => res.json())
      .then((info) => {
        setRows(info);
        console.log(rows)
      })
      .catch((err) => {
        setError(err);
        setRows(null)
      })
      .finally(() => {setLoading(false)})
  }, []);

  
  async function handleDelete(id) {
    const res = await fetch(`https://proj2-api.herokuapp.com/api/catDelete/delete/${id}`, {
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
    handleClick();
    if (data.status) window.location.href = '/cats';
  }

  const actionColumn = [
    {
      field: "action",
      headerName: "Action",
      width: 200,
      renderCell: (params) => {
        return (
          <div className="cellAction">
            <Link to={`/cats/${params.row.id}`} element={<Cat />}>
                  <div className="viewButton">View</div>
                </Link>
            <a href="#">
              <div className="deleteButton" onClick={() => handleDelete(params.row.id)}>
                Delete
              </div>
            </a>
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
        <GridCloseIcon fontSize="small" />
      </IconButton>
    </React.Fragment>
  );

  return (
    <div style={{ height: '80%', width: "100%" }} className="datatable">
      <div className="datatableTitle">
        Add New Cat
        <a href="/cats/new">Add Cat</a>
      </div>
      <div className="spinner">
      {loading && <div><CircularProgress color="success" className="iconSpinner" size={400}/></div>}
      {error && (
        <div>{`There is a problem fetching the post data - ${error}`}</div>
      )}
      </div>
      <DataGrid
        rows={rows}
        columns={columns.concat(actionColumn)}
        pageSize={15}
        rowsPerPageOptions={[15]}
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
