import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import axios from 'axios';

function ShowDrinkOrder(){
    const navigate = useNavigate();

    const [drink_orders, setDrink_orders] = useState([]);

    useEffect(() =>{
        getDrinkOrder();
    },[])

    const getDrinkOrder = async () => {
        const response = await axios.get("/FastFood/public/api/show_drink_orders")
        setDrink_orders(reponse.data);
    }

    const newDrinkOrder= () => {
        navigate("/FastFood/public/newDrinkOrder");
    }
    
    const deleteDrinkOrder = async (id) => {
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

        await axios.delete(`http://localhost/FastFood/public/api/delete_drink_orders/${id}`)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            getDrinkOrder()
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
                Drink orders
            </h4>
            <div className="btn-up">
                <Button variant="outline-primary" onClick={()=>newDrinkOrder()}>New drink order</Button>{' '}
            </div>
                <Table striped bordered hover size="sm">
                    <thead>
                        <tr>
                            <th>Drink</th>
                            <th>Order</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {                            
                            drink_orders.length > 0 ? (
                                drink_orders.map((item, key) => (
                                    <tr key={key}>
                                        <td>{item.drink}</td>
                                        <td>{item.order}</td>
                                        <td>
                                            <Link className="btn btn-success me-1" to={`/FastFood/public/editDrinkOrder/${item.id}`}>
                                                Edit
                                            </Link>
                                            <button className="btn btn-danger" onClick={()=>deleteDrinkOrder(item.id)}>
                                                Delete
                                            </button>
                                        </td>
                                    </tr>
                                ))
                            ) : (
                                <>
                                    <tr>
                                        <td colSpan="3">No food orders found</td>
                                    </tr>
                                </>
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

export default ShowDrinkOrder;