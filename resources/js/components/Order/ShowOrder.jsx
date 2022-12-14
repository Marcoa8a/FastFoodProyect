import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import axios from 'axios';

function ShowOrder(){
    const navigate = useNavigate();

    const [orders, setOrders] = useState([]);

    useEffect(() =>{
        getOrder();
    },[])

    const getOrder = async () => {
        const response = await axios.get("/FastFood/public/api/show_orders")
        setOrders(response.data);
    }

    const newOrder= () => {
        navigate("/FastFood/public/newOrder");
    }
    
    const deleteOrder = async (id) => {
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

        await axios.delete(`http://localhost/FastFood/public/api/delete_orders/${id}`)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            getOrder()
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
                Orders
            </h4>
            <div className="btn-up">
                <Button variant="outline-primary" onClick={()=>newOrder()}>New Order</Button>{' '}
            </div>
                <Table striped bordered hover size="sm">
                    <thead>
                        <tr>
                            <th>Price</th>
                            <th>Date</th>
                            <th>Employee</th>
                            <th>User</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {                            
                            orders.length > 0 ? (
                                orders.map((item, key) => (
                                    <tr key={key}>
                                        <td>{item.price}</td>
                                        <td>{item.date}</td>
                                        <td>{item.employee}</td>
                                        <td>{item.user}</td>
                                        <td>
                                            <Link className="btn btn-success me-1" to={`/FastFood/public/editOrder/${item.id}`}>
                                                Edit
                                            </Link>
                                            <button className="btn btn-danger" onClick={()=>deleteOrder(item.id)}>
                                                Delete
                                            </button>
                                        </td>
                                    </tr>
                                ))
                            ) : (
                                <>
                                    <tr>
                                        <td colSpan="5">No orders found</td>
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
                    <Button variant="primary">No s?? que va aqu??</Button>
                </Modal.Footer>
            </Modal>
        </Container>
        </>
    );
}

export default ShowOrder;