import * as React from "react";
import { Routes, Route } from "react-router-dom";
import FastFood from "./FastFood";
import ShowFood from "./Food/ShowFood";
import NewFood from "./Food/NewFood";
import EditFood from "./Food/EditFood";
import ShowDrink from "./Drink/ShowDrink";
import NewDrink from "./Drink/NewDrink";
import EditDrink from "./Drink/EditDrink";
import ShowBrand from "./Brand/ShowBrand";
import NewBrand from "./Brand/NewBrand";
import EditBrand from "./Brand/EditBrand";
import ShowCategory from "./Category/ShowCategory";
import NewCategory from "./Category/NewCategory";
import EditCategory from "./Category/EditCategory";
import ShowJob from "./ShowJob";
import NewJob from "./Job/NewJob";
import EditJob from "./Job/EditJob";
import ShowOrder from "./Order/ShowOrder";
import NewOrder from "./Order/NewOrder";
import EditOrder from "./Order/EditOrder";
import ShowTypeFood from "./Type_food/ShowTypeFood";
import NewTypeFood from "./Type_food/NewTypeFood";
import EditTypeFood from "./Type_food/EditTypeFood";
import ShowTypeDrink from "./Type_drink/ShowTypeDrink";
import NewTypeDrink from "./Type_drink/NewTypeDrink";
import EditTypeDrink from "./Type_drink/EditTypeDrink";
import ShowFoodOrder from "./FoodOrder/ShowFoodOrder";
import NewFoodOrder from "./FoodOrder/NewFoodOrder";
import EditFoodOrder from "./FoodOrder/EditFoodOrder";
import ShowDrinkOrder from "./DrinkOrder/ShowDrinkOrder";
import NewDrinkOrder from "./DrinkOrder/NewDrinkOrder";
import EditDrinkOrder from "./DrinkOrder/EditDrinkOrder";
import NewUser from "./NewUser";
import Login from "./Login";
import Carrousel from "./Carrousel";
import { BrowserRouter } from "react-router-dom";

export default function App(){
    return(
        <div className="App">
            <BrowserRouter>
                <Routes>
                    <Route path="/FastFood/public/" element={<FastFood />} >                       
                        <Route path="home" element={<Carrousel />} />

                        <Route path="register" element={<NewUser />} />
                        <Route path="login" element={<Login />} />

                        <Route path="fastfood" element={<FastFood />} />
                        <Route path="showfood" element={<ShowFood />} />
                        <Route path="newFood" element={<NewFood />}/>
                        <Route path="editFood/:id" element={<EditFood />} />

                        <Route path="showDrink" element={<ShowDrink />} />
                        <Route path="newDrink" element={<NewDrink />}/>
                        <Route path="editDrink/:id" element={<EditDrink />} />

                        <Route path="showBrand" element={<ShowBrand />} />
                        <Route path="newBrand" element={<NewBrand />}/>
                        <Route path="editBrand/:id" element={<EditBrand />} />

                        <Route path="showCategory" element={<ShowCategory />} />
                        <Route path="newCategory" element={<NewCategory />} />
                        <Route path="editCategory/:id" element={<EditCategory />} />

                        <Route path="showJob" element={<ShowJob />} />
                        <Route path="newJob" element={<NewJob />} />
                        <Route path="editJob/:id" element={<EditJob />} />

                        <Route path="showOrder" element={<ShowOrder />} />
                        <Route path="newOrder" element={<NewOrder />} />
                        <Route path="editOrder/:id" element={<EditOrder />} />

                        <Route path="showTypeFood" element={<ShowTypeFood />} />
                        <Route path="newTypeFood" element={<NewTypeFood />} />
                        <Route path="editTypeFood/:id" element={<EditTypeFood />} />

                        <Route path="showTypeDrink" element={<ShowTypeDrink />} />
                        <Route path="newTypeDrink" element={<NewTypeDrink />} />
                        <Route path="editTypeDrink/:id" element={<EditTypeDrink />} />

                        <Route path="showFoodOrder" element={<ShowFoodOrder />} />
                        <Route path="newFoodOrder" element={<NewFoodOrder />} />
                        <Route path="editFoodOrder/:id" element={<EditFoodOrder />}/>
                        
                        <Route path="showDrinkOrder" element={<ShowDrinkOrder />} />
                        <Route path="newDrinkOrder" element={<NewDrinkOrder />} />
                        <Route path="editDrinkOrder/:id" element={<EditDrinkOrder />}/>

                    </Route>
                </Routes>
            </BrowserRouter>
        </div>
    );
}