import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import {signInWithEmailAndPassword, sendEmailVerification} from 'firebase/auth'
import firebase from "firebase";
import { BrowserRouter, Navigate, useNavigation } from "react-router-dom";
import styles from './login.module.scss'
import img from '../../assets/Hitcherr_logo.png'
import LoadingSpinner from "./LoadingSpinner";
import "./styles.css";


const Login =  () => {
    const [email, setEmail] = useState("")
    const [pass, setPass] = useState("")
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState();

    const getUser = ()=>{
        const data = db.collection('users').where("email","==",firebase.auth().currentUser.email)
                    .get()
                    .then((res)=>{
                        console.log(res.docs[0].data())
                    })
    }

    const submitForm = (event)=>{
        setIsLoading(true);
        firebase.auth().signInWithEmailAndPassword(email, pass)
        .then((userCredential) => {
            // Signed in
            // window.location = 'approve_requests'
            db.collection('users').where("email","==",userCredential.user.email).get()
                .then((res)=>{
                    let data = res.docs[0].data()
                    // console.log("here:",data)
                    if(data.type  != 3)
                    {
                        setIsLoading(false);
                        setError("Username is invalid")

                        firebase.auth().signOut().then(function() {
                            console.log("signout successful")
                          }).catch(function(error) {
                            // An error happened.
                          });
                        //auth().signOut();
                    }
                    else
                    {
                        setIsLoading(false)
                        window.location='/approve_requests'

                    }
                })
                .catch((err)=>{
                    setIsLoading(false)
                    //window.location='/'
                    setError("Username or Password is invalid")

                })
                
            // ...
        }).catch((err) => {
            setIsLoading(false)
            //window.location='/'
            setError("Username or Password is invalid")
        })
        .catch((error) => {
            var errorCode = error.code;
            var errorMessage = error.message;
        });
        
    }

    const renderPage = () => {
        window.location='/approve_requests'

    }


    return (
        <div className='d-flex align-items-center min-vh-100 w-50 mx-auto' >
            <div className='container rounded-4 bg-dark shadow-lg my-auto d-flex justify-content-evenly'>
                <div className="d-flex justify-content-center">
                    <img src={img} alt="logo"  className={styles.logo}/>
                </div>
                <div className="my-auto">
                    <div className="text-center mb-4">
                        <h2 className={styles.text}>Admin Portal</h2>
                    </div>
                    <div className="mb-3">
                        <label for='email' className='text-light me-4 pe-4'>Email:</label>
                        <input className={styles.field_input} id='email' placeholder=" Enter Email" type={"text"} onChange = {(event=> setEmail(event.target.value))}/>
                    </div>
                    <div className="mb-3">
                        <label for='password' className='text-light me-3'>Password:</label>
                        <input className={styles.field_input} id='password' placeholder=" Enter Password" type={"password"} onChange = {(event) => setPass(event.target.value)}/>
                        {error ? <p style={{color:"red", fontSize:"10px"}} >{error}</p>:null}

                    </div>
                    <div className='d-flex justify-content-end'>
                        <button className="btn btn-light" onClick = {submitForm} disabled={isLoading} >Login</button> 
                        
                    </div>
                </div>
                
            </div>
            <div style={{marginLeft:10}}>
            {isLoading ? <LoadingSpinner /> : renderPage}
            </div>


        </div>
    )
}

export default Login