import React, { useEffect, useState } from "react";
import { Card, Row, Col } from "react-bootstrap";
import { useParams } from "react-router-dom";

const CatDetailsCard = () => {
  const [cat, setCat] = useState();
  const { id } = useParams();

  useEffect(() => {
    fetch(`https://proj2-api.herokuapp.com/api/cat/${id}`, {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        accessToken: localStorage.getItem("accessToken"),
      },
    })
    .then(res => res.json())
    .then((data) => {
      setCat(data);
      console.log(data);
    })
  }, [])

  return (
    <div className="">
      {cat && cat.map(({ id, name, breed, age, image, breeder }) => (
      <Card className="shadow m-3 p-2" key={id}>
      <img src={image} width='80%' className='mt-3 mx-auto d-block img-thumbnail shadow rounded-circle' alt='Cat Photo'/>
        <i className="fa-solid fa-pen-to-square btn"></i>
      <Row>
        <Col>
          <Card.Text className="fs-2">Name:</Card.Text>
        </Col>
        <Col>
        <Card.Text className="fs-2">{name}</Card.Text>
        </Col>
      </Row>
      <Row>
        <Col>
          <Card.Text className="fs-2">Breed:</Card.Text>
        </Col>
        <Col>
          <Card.Text className="fs-2">{breed}</Card.Text>
        </Col>
      </Row>
      <Row>
        <Col>
          <Card.Text className="fs-2">Age:</Card.Text>
        </Col>
        <Col>
          <Card.Text className="fs-2">{age}</Card.Text>
        </Col>
      </Row>
      <Row>
        <Col>
          <Card.Text className="fs-2">Breeder</Card.Text>
        </Col>
        <Col>
          <Card.Text className="fs-2">{breeder}</Card.Text>
        </Col>
      </Row>
      <Row>
        <Col>
          <i className="fa-solid fa-pen-to-square btn"></i>
        </Col>
        <Col>
          <i className="fa-solid fa-trash-can btn"></i>
        </Col>
      </Row>
    </Card>
    ))}
    </div>
    
  );
};

export default CatDetailsCard;
