import axios from "axios";
import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import { useNavigate } from 'react-router-dom';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

const NewDrinkOrder = () => {
    const navigate = useNavigate();
    
    const [drink_id, setDrink_id] = useState("");
    const [order_id, setOrder_id] = useState("");
    const [validationError, setValidationError] = useState({});

    const createDrinkOrder = async (e) =>{
        e.preventDefault();

        const formData = new FormData();
        
        formData.append('drink_id', drink_id);
        formData.append('order_id', order_id);

        await axios.post("http://localhost/FastFood/public/api/register_drink_order",formData)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            navigate("/FastFood/public/showDrinkOrder");
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
                                Create drink order
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
                                <Form onSubmit={createDrinkOrder}>  
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="Drink_id">
                                                <Form.Label>Drink_id</Form.Label>
                                                <Form.Control type="number" value={drink_id} onChange={(event) => {setDrink_id(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>   
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="Order_id">
                                                <Form.Label>Order_id</Form.Label>
                                                <Form.Control type="number" value={order_id} onChange={(event) => {setOrder_id(event.target.value)}}  />
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

export default NewDrinkOrder;