import axios from "axios";
import React, { useState } from "react";
import Button from 'react-bootstrap/Button';
import { useNavigate } from 'react-router-dom';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

const NewUser = () => {
    const navigate = useNavigate();

    const [name, setName] = useState("");
    const [last_name, setlast_name]= useState("");
    const [phone, setPhone]= useState("");
    const [email, setEmail]= useState("");
    const [password, setPassword]= useState("");
    const [validationError, setValidationError]= useState({});

    const createUser = async (e) =>{
        e.preventDefault();

        const formData = new FormData();

        formData.append('name', name);
        formData.append('last_name', last_name);
        formData.append('phone', phone);
        formData.append('email', email);
        formData.append('password', password);

        await axios.post("http://localhost/FastFood/public/api/register", formData, {
            headers: {
                'Content-Type': 'application/json' }, 
            }
        )
        .then(({data})=>{
            Swal.fire({
                title: "Usuario registrado",
                icon: "success",
                text: data.message
            })
            navigate("/Fastfood/public/");
        })
        .catch(({response}) => {
            if(response.status == 422){
                setValidationError(response.data.errors);
            }else{
                Swal.fire({
                    text: response.data.message,
                    icon: "error"
                })
            }
        })
    }

    return(
        <div className="containerNewUser">
            <div className="row justify-content-center">
                <div className="col-12 col-sm-12 col-md-6">
                    <div className="card">
                        <div className="card-body">
                            <h4 className="card-title">
                                Create Account
                            </h4>
                            <div className="form-wrapper">
                                {Object.keys(validationError).length > 0 &&
                                (
                                    <div className="row">
                                        <div className="col-12">
                                            <div className="alert alert-danger">
                                                <ul className="mb-0">
                                                    {Object.entries(validationError).map(([key, value])=>(
                                                        <li key={key}>{value}</li>
                                                    ))}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                )}
                                <Form onSubmit={createUser}>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="name">
                                                <Form.Label>Name</Form.Label>
                                                <Form.Control type="text" value={name} onChange={(event) => {setName(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="last_name">
                                                <Form.Label>Last name</Form.Label>
                                                <Form.Control type="text" value={last_name} onChange={(event) => {setlast_name(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="phone">
                                                <Form.Label>Phone</Form.Label>
                                                <Form.Control type="text" value={phone} onChange={(event) => {setPhone(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row> 
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="email">
                                                <Form.Label>Email</Form.Label>
                                                <Form.Control type="email" value={email} onChange={(event) => {setEmail(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="password">
                                                <Form.Label>Password</Form.Label>
                                                <Form.Control type="password" value={password} onChange={(event) => {setPassword(event.target.value)}}  />
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Button variant="primary" className="mt-2" size="lg" block="block" type="submit">
                                        Register
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
export default NewUser;