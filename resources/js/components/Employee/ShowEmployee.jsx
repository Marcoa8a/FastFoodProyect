import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import axios from 'axios';

const showEmployee = () => {
    const navigate = useNavigate();

    const [employees, setEmployees] = useState([]);

    useEffect(() =>{
        getEmployee();
    },[])

    const getEmployee = async () => {
        const response = await axios.get("/FastFood/public/api/show_employees")
        setEmployees(response.data)
        /*.then(({data}) => {
            console.log(data.foods)
            setFoods(data.foods);
        })*/
    }

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    return (        
        <>
        <Container>
            <h4 className="table-title">
                Employees
            </h4>
                    <Table striped bordered hover size="sm">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>last_name</th>
                                <th>email</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>category_id</th>
                                <th>type_id</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {                            
                                foods.length > 0 && (
                                    foods.map((item, key) => (
                                        <tr key={key}>
                                            <td>{item.name}</td>
                                            <td>{item.price}</td>
                                            <td>{item.calories}</td>
                                            <td>{item.description}</td>
                                            <td>
                                                <img src={`http://localhost/storage/food/image/${item.image}`} height="40px" />
                                            </td>
                                            <td>{item.category}</td>

                                            <td>{item.typeFood}</td>
                                            <td>
                                                <Link className="btn btn-success me-1" to={`/FastFood/public/editFood/${item.id}`}>
                                                    Edit
                                                </Link>
                                                <button className="btn btn-danger" onClick={()=>deleteFood(item.id)}>
                                                    Delete
                                                </button>
                                            </td>
                                        </tr>
                                    ))
                                )                            
                            }
                        </tbody>
                    </Table>
            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
                size="lg"
            >
                <Modal.Header closeButton>
                    <Modal.Title>Foods</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    
                </Modal.Body>
                
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                    <Button variant="primary">No sé que va aquí</Button>
                </Modal.Footer>
            </Modal>
        </Container>
        </>
    );
}

export default showEmployee