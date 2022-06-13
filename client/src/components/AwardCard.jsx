import React, { useEffect, useState } from "react";
import { Row, Col } from "react-bootstrap";

const AwardCard = () => {
  const [awards, setAwards] = useState();
  
  useEffect(() => {
    const email = localStorage.getItem('email');
      fetch(`https://proj2-api.herokuapp.com/awards/${email}`, {
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          accessToken: localStorage.getItem("accessToken"),
        },
      })
      .then((res) => res.json())
      .then((data) => {
        setAwards(data)
        console.log(data);
      });
  }, []);

  return (
    <div>
      {awards && awards.map(({ id, title, year }) => (
        <a href="/award/:id" className="rounded mx-3 mt-3 bg-light shadow card p-2 btn" key={id}>
        <Row>
          <Col>
            <i className="fa-solid fa-award"></i>
          </Col>
          <Col>{title}</Col>
          <Col>{year}</Col>
          <Col><i className="fa-solid fa-minus"></i></Col>
        </Row>
      </a>
      ))}
    </div>
  );
};

export default AwardCard;
