import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router';
import { useAxios } from '../services/axios.service';
import { useLocalStorage } from '../services/localStorage.service';

import './PastOrders.css'

export default function PastOrders() {

    const http = useAxios();
    const navigate = useNavigate();
    const ls = useLocalStorage();
    let user = ls.getUser();

    const [transactions, setTransactions] = useState([]);

    function getAllTransactionsByUserId() {
        {
            !user ? navigate(`/login`) :
                http.getAllTransactionsByUserId(user.id)

                    .then((response) => {

                        console.log(response.data.transactions);
                        setTransactions(response.data.transactions);

                        // { transactions ? window.alert("No orders found, try loggin in or complete a purchase") : window.alert("These are your orders on file") }
                        // console.log(transactions)

                    })
                    .catch((err) => {
                        console.log("error getting all", err);

                        // window.alert("No record found, try logging in, or complete a transaction");
                    })

        }
    }


    useEffect(() => {

        getAllTransactionsByUserId();

    }, []);

    return (


        < div className="past-orders-root">
            {!transactions.length ?
                <span>No Transactions Found</span> :
                < table >

                    <tr>
                        <th>Order Number</th>
                        <th>Date of Order</th>
                        <th>Total</th>
                    </tr>
                    {transactions.map((transaction) => (
                        <tr
                            className="transaction"
                            key={transaction.id}
                        >
                            <td>{transaction.id}</td>
                            <td>{new Date(transaction.date).toLocaleDateString()}</td>
                            <td>${transaction.total.toFixed(2)}</td>
                        </tr>
                    ))}
                </table>
            }

        </div >

    )

}
