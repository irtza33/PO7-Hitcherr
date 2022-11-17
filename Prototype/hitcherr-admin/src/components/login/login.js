import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import {signInWithEmailAndPassword, sendEmailVerification} from 'firebase/auth'
import firebase from "firebase";
import { BrowserRouter, useNavigation } from "react-router-dom";

const Login =  () => {
    const [email, setEmail] = useState("")
    const [pass, setPass] = useState("")

    const getUser = ()=>{
        const data = db.collection('users').where("email","==",firebase.auth().currentUser.email)
                    .get()
                    .then((res)=>{
                        console.log(res.docs[0].data())
                    })
    }

    const submitForm = (event)=>{
        firebase.auth().signInWithEmailAndPassword(email, pass)
        .then((userCredential) => {
            // Signed in
            window.location = 'approve_requests'
            // ...
        })
        .catch((error) => {
            var errorCode = error.code;
            var errorMessage = error.message;
        });
        
    }


    return (
        <div className="App">
            <h2>Hitcherr Login Page</h2>
            <div>
                <label>Email</label>
                <input placeholder="Email" type={"text"} onChange = {(event=> setEmail(event.target.value))}/>
            </div>
            <div>
                <label>Password</label>
                <input placeholder="Password" type={"password"} onChange = {(event) => setPass(event.target.value)}/>
            </div>
            <div>
                <button onClick = {submitForm}>Login</button> 
            </div>
        </div>
    )
}

export default Login