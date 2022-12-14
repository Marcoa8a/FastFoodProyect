import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axios from 'axios';
import Button from 'react-bootstrap/Button';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

const EditFoodOrder = () => {

    const navigate = useNavigate();

    const { id } = useParams();
    
    const [food_id, setFood_id] = useState("");
    const [order_id, setOrder_id] = useState("");
    const [validationError, setValidationError] = useState({});

    useEffect(()=>{
        getFoodOrder();
    }, [])

    const getFoodOrder = async () => {
        await axios.get(`http://localhost/FastFood/public/api/edit_food_orders/${id}`)
        .then(({data})=>{
            //console.log('data',data);
            const { food_id, order_id} = data.food_order;
            setFood_id(food_id);
            setOrder_id(order_id);
        })
        .catch(({response:{data}})=>{
            Swal.fire({
                text: data.message,
                icon: "error"
            })
        })
    }

    const updateFoodOrder = async (e) => {
        e.preventDefault();

        const formData = new FormData();
        
        formData.append('_method', 'PUT');
        formData.append('food_id', food_id);
        formData.append('order_id', order_id);

        await axios.post(`http://localhost/FastFood/public/api/update_food_orders/${id}`, formData)
        .then(({data})=>{
            Swal.fire({
                icon: "success",
                text: data.message
            })
            navigate("/FastFood/public/showFoodOrder");
        })
        .catch(({response})=>{
            if(response.status === 422){
                setValidationError(response.errors);
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
                                Update food order
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
                                <Form onSubmit={updateFoodOrder}>  
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="Food_id">
                                                <Form.Label>Food_id</Form.Label>
                                                <Form.Control type="number" value={food_id} onChange={(event) => {setFood_id(event.target.value)}}  />
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
                                        Update
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

export default EditFoodOrder;