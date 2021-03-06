import React from 'react';
import ReactDOM from 'react-dom/client';
import { Route, Routes, BrowserRouter } from 'react-router-dom'
import './index.css';
import App from './App';
import NavBar from './components/NavBar/NavBar';
// import Tents from './components/Tents'
// import Backpacks from './components/Backpacks'
// import Tents from './components/unused-components/Tents'
// import Sleepingbags from './components/unused-components/Sleepingbags'
// import Accessories from './components/unused-components/Accessories'
import Homepage from './components/Homepage';
import reportWebVitals from './reportWebVitals';
import ProductPage from './components/ProductPage';
import ShoppingCart from './components/ShoppingCart'
import SignUpPage from './components/login/SignUpPage'
import LogInPage from './components/login/LogInPage'
import OrderConfirmPage from './components/OrderConfirmPage'
import PastOrders from './components/PastOrders'

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <NavBar />
      <Routes>
        <Route path="/" element={<Homepage />} />
        <Route path="/products" element={<App />} />
        <Route path="/cart" element={<ShoppingCart />} />
        {/* <Route path="/tents" element={<Tents />} /> */}
        <Route path="/login" element={<LogInPage />} />
        <Route path="/signup" element={<SignUpPage />} />
        <Route path="/products/:category" element={<ProductPage />} />
        <Route path="/orderconfirm/:transactionId" element={<OrderConfirmPage />} /> */}
        <Route path="/transactions" element={<PastOrders />} />
        <Route path="*" element={<div>404 - That Page Does Not Exist</div>} />
        {/* <Route path="/backpacks" element={<Backpacks />} /> */}
        {/* <Route path="/sleepingbags" element={<Sleepingbags />} /> */}
        {/* <Route path="/accessories" element={<Accessories />} /> */}

      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
