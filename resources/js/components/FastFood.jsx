import ReactDOM from 'react-dom/client';
import Navbar from 'react-bootstrap/Navbar';
import React, { useState } from 'react';
import { NavDropdown } from 'react-bootstrap';
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import {Outlet, Link} from 'react-router-dom';
import { CDBFooter, CDBFooterLink, CDBBtn, CDBIcon, CDBContainer, CDBBox } from 'cdbreact';
import { useLocation } from 'react-router-dom';

function Example() {
    const location = useLocation();

    console.log(location.state)
    return (
        <>
            <Navbar bg="dark" expand="lg" variant="dark">
                <Container>
                    <Navbar.Brand as={Link} to="/FastFood/public/home">FastFood</Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <Nav.Link as={Link} to="/FastFood/public/home">Home</Nav.Link>
                            <NavDropdown title="Products" id="navbarScrollingDropdown">
                                <NavDropdown.Item as={Link} to="/FastFood/public/showfood">View food catalog</NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item as={Link} to="/FastFood/public/showDrink">View drink catalog</NavDropdown.Item>
                            </NavDropdown>

                            <NavDropdown title="About products" id="navbarScrollingDropdown">
                              <NavDropdown.Item as={Link} to="/FastFood/public/showBrand">Brands</NavDropdown.Item>
                              <NavDropdown.Divider />
                              <NavDropdown.Item as={Link} to="/FastFood/public/showCategory">Categories</NavDropdown.Item>
                              <NavDropdown.Divider />
                              <NavDropdown.Item as={Link} to="/FastFood/public/showTypeFood">Type Foods</NavDropdown.Item>
                              <NavDropdown.Divider />
                              <NavDropdown.Item as={Link} to="/FastFood/public/showTypeDrink">Type Drinks</NavDropdown.Item>
                            </NavDropdown>

                            <NavDropdown title="Orders" id="navbarScrollingDropdown">
                              <NavDropdown.Item as={Link} to="/FastFood/public/showOrder">Orders</NavDropdown.Item>
                              <NavDropdown.Divider />
                              <NavDropdown.Item as={Link} to="/FastFood/public/showFoodOrder">Food Orders</NavDropdown.Item>
                              <NavDropdown.Divider />
                              <NavDropdown.Item as={Link} to="/FastFood/public/showDrinkOrder">Drink Orders</NavDropdown.Item>
                            </NavDropdown>

                            <NavDropdown title="Personal" id="navbarScrollingDropdown">
                              <NavDropdown.Item as={Link} to="/FastFood/public/showJob">Jobs</NavDropdown.Item>
                            </NavDropdown>

                            <Nav.Link as={Link} to="/FastFood/public/register">Register</Nav.Link>
                            <Nav.Link as={Link} to="/FastFood/public/login">Login</Nav.Link>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
            <section>
                <Outlet></Outlet>
            </section>    
            <CDBFooter className="shadow">
              <CDBBox display="flex" flex="column" className=" mx-auto py-5" style={{ width: '80%' }}>
                <CDBBox display="flex" justifyContent="between" className="flex-wrap">
                  <CDBBox>
                    <a href="#" className="d-flex align-items-center p-0 text-dark">
                      <span className="ml-3 h5 font-weight-bold">FastFood</span>
                    </a>
                  </CDBBox>
                  <CDBBox display="flex" style={{ width: '50%' }} justifyContent="between">
                    <CDBBox>
                      <p className="h5 mb-4" style={{ fontWeight: '600' }}>
                        About products
                      </p>
                      <CDBBox flex="column" display="flex" style={{ cursor: 'pointer', padding: '0'}}>
                        <CDBFooterLink as={Link} to="/FastFood/public/showBrand">Brands</CDBFooterLink>
                        <CDBFooterLink as={Link} to="/FastFood/public/showCategory">Categories</CDBFooterLink>
                      </CDBBox>
                    </CDBBox>
                    <CDBBox>
                      <p className="h5 mb-4" style={{ fontWeight: '600' }}>
                        Products
                      </p>
                      <CDBBox display="flex" flex="column" style={{ cursor: 'pointer', padding: '0' }}>
                        <CDBFooterLink as={Link} to="/FastFood/public/showFood">Foods</CDBFooterLink>
                        <CDBFooterLink as={Link} to="/FastFood/public/showDrink">Drinks</CDBFooterLink>
                      </CDBBox>
                    </CDBBox>
                    <CDBBox>
                      <p className="h5 mb-4" style={{ fontWeight: '600' }}>
                        Orders
                      </p>
                      <CDBBox display="flex" flex="column" style={{ cursor: 'pointer', padding: '0' }}>
                        <CDBFooterLink as={Link} to="/FastFood/public/showOrder">Orders</CDBFooterLink>
                        <CDBFooterLink as={Link} to="/FastFood/public/showFoodOrder">Food Orders</CDBFooterLink>
                        <CDBFooterLink as={Link} to="/FastFood/public/showDrinkOrdre">Drink Orders</CDBFooterLink>
                      </CDBBox>
                    </CDBBox>
                    <CDBBox>
                      <p className="h5 mb-4" style={{ fontWeight: '600' }}>
                        Personal
                      </p>
                      <CDBBox display="flex" flex="column" style={{ cursor: 'pointer', padding: '0' }}>
                        <CDBFooterLink as={Link} to="/FastFood/public/showJob">Jobs</CDBFooterLink>
                      </CDBBox>
                    </CDBBox>
                  </CDBBox>
                </CDBBox>
                <CDBBox display="flex" className="mt-4" justifyContent="between">
                  <small className="ml-2">&copy; FastFood, 2022. All rights reserved.</small>
                  <CDBBox display="flex">
                    <CDBBtn flat color="dark" className="p-2">
                      <CDBIcon fab icon="facebook-f" />
                    </CDBBtn>
                    <CDBBtn flat color="dark" className="mx-3 p-2">
                      <CDBIcon fab icon="twitter" />
                    </CDBBtn>
                    <CDBBtn flat color="dark" className="p-2">
                      <CDBIcon fab icon="instagram" />
                    </CDBBtn>
                  </CDBBox>
                </CDBBox>
              </CDBBox>
          </CDBFooter>
        
        </>        
    );
}

export default Example;