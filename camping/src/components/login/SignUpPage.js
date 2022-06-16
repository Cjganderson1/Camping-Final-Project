import React, { useState } from 'react'
import { Link, useNavigate, useAlert } from 'react-router-dom'
import { useAxios } from '../../services/axios.service'
import './SignUpPage.css'
import { useLocalStorage } from '../../services/localStorage.service'
import { faCampground } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faFontAwesome } from '@fortawesome/free-solid-svg-icons';


export default function SignUpPage() {

    const navigate = useNavigate();
    const http = useAxios();
    const ls = useLocalStorage();

    function attemptSignUp(user) {
        http.createNewUser(user)
            .then(res => {
                const user = res.data.user;
                ls.saveUser(user);
                navigate(`/`);
            }).catch(err => {

                if (err.response.status == 400 ? alert("message: that email/password already exists") : alert("message: there was an eror creating a new user"))

                    console.error(err);
            });
    }

    return (

        <div className="login-root">
            <div className="login">
                <br />
                <SignUpForm onSubmit={attemptSignUp} />
                {/* <Link to="/login">
                    <button type="button">Log In</button>
                </Link> */}
                <hr />
                <br />
                <h4 className="login-faCampground" ><span >Boon  &nbsp;<FontAwesomeIcon icon={faCampground} />&nbsp; Docks</span></h4>
                <br />
                <br />
            </div>
        </div>
    )
}

function SignUpForm({ onSubmit }) {

    const [user, setUser] = useState({
        email: '',
        password: ''
    });
    const [isEmailTaken, setIsEmailTaken] = useState(true);

    function handleChange(e) {
        var name = e.target.name;
        var value = e.target.value;

        setUser({
            ...user,
            [name]: value
        });
    }

    function handleSubmit(e) {
        e.preventDefault();
        if (user.email && user.password) {
            onSubmit(user);
        }
    }

    return (
        <div className="login-container">
            <form onSubmit={handleSubmit}>

                <button type="submit"
                    disabled={!user.email || !user.password}>
                    Sign Up
                </button>
                <br />
                <label >Email:</label>
                <input type="text"
                    className={isEmailTaken ? 'email-taken' : ''}
                    name="email"
                    required
                    value={user.email}
                    onChange={handleChange} />
                <br />
                <label>Create Password:</label>
                <input type="password"
                    name="password"
                    value={user.password}
                    onChange={handleChange} />


            </form>
        </div>
    )
}