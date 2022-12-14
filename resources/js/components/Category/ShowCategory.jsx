import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import axios from 'axios';

function ShowCategory (){
    const navigate = useNavigate();

    const [categories, setCategories] = useState([]);

    useEffect(() =>{
        getCategory();
    },[])

    const getCategory = async () => {
        await axios.get("/FastFood/public/api/show_categories")
        .then(({data}) => {
            setCategories(data.categories);
        })
    }

    const newCategory= () => {
        navigate("/FastFood/public/newCategory");
    }
    
    const deleteCategory = async (id) => {
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

        await axios.delete(`http://localhost/FastFood/public/api/delete_categories/${id}`)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            getCategory()
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
                Categories table
            </h4>
            <div className="btn-up">
                <Button variant="outline-primary" onClick={()=>newCategory()}>Add Category</Button>{' '}
            </div>
                <Table striped bordered hover size="sm">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {                            
                            categories.length > 0 && (
                                categories.map((item, key) => (
                                    <tr key={key}>
                                        <td>{item.name}</td>
                                        <td>
                                            <Link className="btn btn-success me-1" to={`/FastFood/public/editCategory/${item.id}`}>
                                                Edit
                                            </Link>
                                            <button className="btn btn-danger" onClick={()=>deleteCategory(item.id)}>
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

export default ShowCategory;