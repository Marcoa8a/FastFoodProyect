import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import axios from 'axios';

function ShowDrink()  {

    const navigate = useNavigate();

    const [drinks, setDrinks] = useState([]);

    useEffect(() =>{
        getDrink();
    },[])

    const getDrink = async () => {
        const response = await axios.get("/FastFood/public/api/show_drinks")
        setDrinks(response.data);
    }

    const newDrink = () => {
        navigate("/FastFood/public/newDrink");
    }
    
    const deleteDrink = async (id) => {
        const isConfirm = await Swal.fire({
            title: 'Are you sure??',
            text: "You won't be able to revert this",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        })
        .then((result) => {
            return result.isConfirmed
        })

        if(!isConfirm){
            return;
        }

        await axios.delete(`http://localhost/FastFood/public/api/delete_drinks/${id}`)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            getDrink()
        })
        .catch(({response:{data}}) => {
            Swal.fire({
                text: data.message,
                icon: 'error'
            })
        })
    }

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    return (        
        <>
        <Container>
            <h4 className="table-title">
                Drinks table
            </h4>
                    <div className="btn-up">
                        <Button variant="outline-primary" onClick={()=>newDrink()}>Add Drink</Button>{' '}
                    </div>
                    <Table striped bordered hover size="sm">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>Size</th>
                                <th>Flavor</th>
                                <th>Type_id</th>
                                <th>Brand_id</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {                            
                                drinks.length > 0 && (
                                    drinks.map((item, key) => (
                                        <tr key={key}>
                                            <td>{item.name}</td>
                                            <td>{item.price}</td>
                                            <td>{item.description}</td>
                                            <td>
                                                <img src={`http://localhost/storage/drink/image/${item.image}`} height="40px" />
                                            </td>
                                            <td>{item.quantity}</td>
                                            <td>{item.size}</td>
                                            <td>{item.flavor}</td>
                                            <td>{item.typeDrink}</td>
                                            <td>{item.brand}</td>
                                            <td>
                                                <Link className="btn btn-success me-1" to={`/FastFood/public/editDrink/${item.id}`}>
                                                    Edit
                                                </Link>
                                                <button className="btn btn-danger" onClick={()=>deleteDrink(item.id)}>
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
                    <Modal.Title>Drinks</Modal.Title>
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

export default ShowDrink;