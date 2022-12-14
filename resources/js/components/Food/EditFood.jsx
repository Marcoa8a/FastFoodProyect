import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axios from 'axios';
import Button from 'react-bootstrap/Button';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

const EditFood = () => {

    const navigate = useNavigate();

    const { id } = useParams();

    const [name, setName] = useState("");
    const [price, setPrice] = useState("");
    const [calories, setCalories] = useState("");
    const [description, setDescription] = useState("");
    const [image, setImage] = useState(null);
    const [category_id, setCategory_id] = useState("");
    const [type_id, setType_id] = useState("");
    const [validationError, setValidationError] = useState({});

    useEffect(()=>{
        getFood();
    }, [])

    const getFood = async () => {
        await axios.get(`http://localhost/FastFood/public/api/edit_foods/${id}`)
        .then(({data})=>{
            //console.log('data',data);
            const { name, price, calories, description, category_id, type_id} = data.food;
            setName(name);
            setPrice(price);
            setCalories(calories);
            setDescription(description);
            setCategory_id(category_id);
            setType_id(type_id);
        })
        .catch(({response:{data}})=>{
            Swal.fire({
                text: data.message,
                icon: "error"
            })
        })
    }

    const changeHandler = (event) => {
        setImage(event.target.files[0]);
    }

    const updateFood = async (e) => {
        e.preventDefault();

        const formData = new FormData();
        
        formData.append('_method', 'PUT');
        formData.append('name', name);
        formData.append('price', price);
        formData.append('calories', calories);
        formData.append('description', description);
        if(image !== null){
            formData.append('image', image)
        }
        formData.append('category_id', category_id);
        formData.append('type_id', type_id);

        await axios.post(`http://localhost/FastFood/public/api/update_foods/${id}`, formData)
        .then(({data})=>{
            Swal.fire({
                icon: "success",
                text: data.message
            })
            navigate("/FastFood/public/showfood");
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

    return(
        <div className="containerNewProducts">
        <div className="row justify-content-center">
            <div className="col-12 col-sm-12 col-md-6">
                <div className="card">
                    <div className="card-body">
                        <h4 className="card-title">
                            Update Food
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
                            <Form onSubmit={updateFood}>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="Name">
                                            <Form.Label>Name</Form.Label>
                                            <Form.Control type="text" value={name} onChange={(event) => {setName(event.target.value)}}  />
                                        </Form.Group>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="price">
                                            <Form.Label>Price</Form.Label>
                                            <Form.Control type="number" value={price} onChange={(event) => {setPrice(event.target.value)}}  />
                                        </Form.Group>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="Calories">
                                            <Form.Label>Calories</Form.Label>
                                            <Form.Control type="text" value={calories} onChange={(event) => {setCalories(event.target.value)}}  />
                                        </Form.Group>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="Description">
                                            <Form.Label>Description</Form.Label>
                                            <Form.Control type="textarea" rows={3} value={description} onChange={(event) => {setDescription(event.target.value)}}  />
                                        </Form.Group>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="Image">
                                            <Form.Label>Image</Form.Label>
                                            <Form.Control type="file" onChange={changeHandler}/>
                                        </Form.Group>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="category_id">
                                            <Form.Label>Category Id</Form.Label>
                                            <Form.Control type="number" value={category_id} onChange={(event) => {setCategory_id(event.target.value)}}  />
                                        </Form.Group>
                                    </Col>
                                </Row>
                                <Row>
                                    <Col>
                                        <Form.Group controlId="type_id">
                                            <Form.Label>Type Id</Form.Label>
                                            <Form.Control type="number" value={type_id} onChange={(event) => {setType_id(event.target.value)}}  />
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
    )
}

export default EditFood;