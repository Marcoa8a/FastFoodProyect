import axios from "axios";
import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import { useNavigate } from 'react-router-dom';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

const NewOrder = () => {
    const navigate = useNavigate();

    
    const [price, setPrice] = useState("");
    const [date, setDate] = useState("");
    const [employee_id, setEmployee_id] = useState("");
    const [user_id, setUser_id] = useState("");
    const [validationError, setValidationError] = useState({});

    const createOrder = async (e) =>{
        e.preventDefault();

        const formData = new FormData();
        
        formData.append('price', price);
        formData.append('date', date);
        formData.append('employee_id', employee_id);
        formData.append('user_id', user_id);

        await axios.post("http://localhost/FastFood/public/api/register_order",formData)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            navigate("/FastFood/public/showOrder");
        })
        .catch(({response}) => {
            if(response.status === 422){
                setValidationError(response.data.errors);
            }else{
                Swal.fire({
                    text: response.data.message,
                    icon: "error"
                })
            }
        })
    }

    return (
        <div className="containerNewProducts">
            <div className="row justify-content-center">
                <div className="col-12 col-sm-12 col-md-6">
                    <div className="card">
                        <div className="card-body">
                            <h4 className="card-title">
                                Create Order
                            </h4>
                            <div className="form-wrapper">
                                {Object.keys(validationError).length > 0 && (
                                    <div className="row">
                                        <div className="col-12">
                                            <div className="alert alert-danger">
                                                <ul className="mb-0">
                                                    {Object.entries(validationError).map(([key, value]) => (
                                                        <li key={key}>{value}</li>
                                                    ))}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                )}
                                <Form onSubmit={createOrder}>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="Price">
                                                <Form.Label>Price</Form.Label>
                                                <Form.Control type="number" value={price} onChange={(event) => {setPrice(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="Date">
                                                <Form.Label>Date</Form.Label>
                                                <Form.Control type="date" value={date} onChange={(event) => {setDate(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>   
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="Employee_id">
                                                <Form.Label>Employee_id</Form.Label>
                                                <Form.Control type="number" value={employee_id} onChange={(event) => {setEmployee_id(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>   
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="User_id">
                                                <Form.Label>User_id</Form.Label>
                                                <Form.Control type="number" value={user_id} onChange={(event) => {setUser_id(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>                                       
                                    <Button variant="primary" className="mt-2" size="lg" block="block" type="submit">
                                        Save
                                    </Button>
                                </Form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default NewOrder;