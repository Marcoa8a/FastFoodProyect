import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useLocation } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import axios from 'axios';

const ShowJob = () => {
    const navigate = useNavigate();
    const location = useLocation();
    const [jobs, setJobs] = useState([]);
    const [token, useToken] = useState([]);

    useEffect(() => {
        try{
            if(location!=undefined || location!=null){
                useToken(location.state.u_token)

                getJob(location.state.u_token)
            }    
        }catch(e){
            Swal.fire({
                title: "Unauthorized",
                text: "Login with a user account validate",
                icon: "warning"
            })
            console.log(e);
            navigate('/FastFood/public/')
        }
    }, [])

    const getJob = async () => {
        const res = await axios.get("http://localhost/FastFood/public/api/show_jobs",{
            headers: {
                'Content-Type': 'multipart/form-data',
                'Accept': 'application/json',
                'Authorization': `Bearer  ${token}`
            }
        })
        setJobs(res.data.jobs)
        console.log(res)
    }

    const newJob = () => {
        navigate("/FastFood/public/newJob");
    }
    
    const deleteJob = async (id) => {
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

        await axios.delete(`http://localhost/FastFood/public/api/delete_jobs/${id}`)
        .then(({data}) => {
            Swal.fire({
                icon: "success",
                text: data.message
            })
            getJob()
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
                Jobs table
            </h4>
            <div className="btn-up">
                <Button variant="outline-primary" onClick={()=>newJob()}>Add Job</Button>{' '}
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
                            jobs.length > 0 && (
                                jobs.map((item, key) => (
                                    <tr key={key}>
                                        <td>{item.name}</td>
                                        <td>
                                            <Link className="btn btn-success me-1" to={`/FastFood/public/editJob/${item.id}`}>
                                                Edit
                                            </Link>
                                            <button className="btn btn-danger" onClick={()=>deleteJob(item.id)}>
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

export default ShowJob;