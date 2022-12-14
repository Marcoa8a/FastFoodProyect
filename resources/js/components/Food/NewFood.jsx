import axios from "axios";
import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import { useNavigate } from 'react-router-dom';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

const NewFood = () => {

    const navigate = useNavigate();

    const [name, setName] = useState("");
    const [price, setPrice] = useState("");
    const [calories, setCalories] = useState("");
    const [description, setDescription] = useState("");
    const [image, setImage] = useState(null);
    const [category_id, setCategory_id] = useState("");
    const [type_id, setType_id] = useState("");
    const [validationError, setValidationError] = useState({});

    const changeHandler = (event) => {
        setImage(event.target.files[0]);
    }

    //Actualizamos la imagen y la insertamos
    /*const changeHandler = (e) => {
        let file = e.target.files[0];
        let reader = new FileReader();
        let limit = 1024 * 1024 * 2;

        if(file['size'] > limit){
            Swal.fire({
                type: 'error',
                title: 'Oops.....',
                text: 'Something went wrong',
                footer: 'Check the information'
            });
        }
        reader.onloadend = (file) => {
            setImage(reader.result);
        }
        reader.readAsDataURL(file);
    }*/

    const createFood = async (e) =>{
        e.preventDefault();

        const formData = new FormData();
        
        formData.append('name', name);
        formData.append('price', price);
        formData.append('calories', calories);
        formData.append('description', description);
        formData.append('image', image);
        formData.append('category_id', category_id);
        formData.append('type_id', type_id);

        await axios.post("http://localhost/FastFood/public/api/register_food",formData)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            navigate("/FastFood/public/showfood");
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

    const Food = () => {
        navigate("/FastFood/public/showfood");
    }


    return (
        <div className="containerNewProducts">
            <div className="row justify-content-center">
                <div className="col-12 col-sm-12 col-md-6">
                    <div className="card">
                        <div className="card-body">
                            <h4 className="card-title">
                                Create Food
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
                                <Form onSubmit={createFood}>
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

export default NewFood;