import axios from "axios";
import React from 'react';
import { useState } from "react";
import Button from 'react-bootstrap/Button';
import { useNavigate } from 'react-router-dom';
import { useLocation } from 'react-router-dom';
import { Form } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import Swal from 'sweetalert2';

function Login(){
    const navigate = useNavigate();
    const location = useLocation();
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [validationError, setValidationError]= useState({});

    const loginUser = async (e) => {
        e.preventDefault()

        const res = await axios.post('http://localhost/FastFood/public/api/login', {
            email: email, password: password
        });
        if (res.data.status === 200){
            Swal.fire({
                title: "Success!",
                text: "Welcome to FastFood",
                icon: "success",
            })
            navigate('/FastFood/public/showJob', {
                state:{
                    u_token: res.data.token
                }
            });
            
        }
        /*if(res.data.status === 200){
            Swal.fire({
                title: "Success!",
                text: "Welcome to FastFood",
                icon: "success",
            })
            navigate('/FastFood/public', {
                localStorage.setItem();
                state: {
                    u_token: res.data.token,
                },
            });
            console.log(res.data);
        }*/
        /*
        .then(({data}) => {
            Swal.fire({
                title: "Usuario logueado",
                icon: "success",
                text: data.message
            })
            navigate("/FastFood/public");
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
        })*/
        /*,{
            headers: {
                'Content-Type': 'multipart/form-data',
                'Accept': 'application.json'
            },
            email: email, password: password

        });
        if(res.data.status === 200 || res.data.status === 201){
            navigate('/FastFood/public', {
                state:{
                    u_token: res.data.token
                }
            });
        }*/
    }

    return(
        <div className="containerNewUser">
            <div className="row justify-content-center">
                <div className="col-12 col-sm-12 col-md-6">
                    <div className="card">
                        <div className="card-body">
                            <h4 className="card-title">
                                Login
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
                                <Form onSubmit={loginUser}> 
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="email">
                                                <Form.Label>Email</Form.Label>
                                                <Form.Control type="email" value={email} onChange={(event) => {setEmail(event.target.value)}}  required/>
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col>
                                            <Form.Group controlId="password">
                                                <Form.Label>Password</Form.Label>
                                                <Form.Control type="password" value={password} onChange={(event) => {setPassword(event.target.value)}} required/>
                                            </Form.Group>
                                        </Col>
                                    </Row>
                                    <Button variant="primary" className="mt-2" size="lg" block="block" type="submit">
                                        Login
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

export default Login;