import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import {signInWithEmailAndPassword, sendEmailVerification} from 'firebase/auth'
import './app_req.css'
import firebase from "firebase";
import App from "../../App";

const ApproveReq = () =>
{
    const [users, setUsers] = useState([])

    const getUser = async ()=>{
        const data = db.collection('users').where("approved","==",false)
                    .get()
                    .then((res)=>{
                        let temp = []
                        res.forEach((item)=>{
                           temp.push(item)
                        })
                        setUsers(temp)
                    })
    }

    useEffect(()=>{
        getUser()
    }
        ,)


    
    return (
        <div id="App">
            <h1>Pending Requests</h1>
            <div>
            {users.map((item)=>{
                function handleChange(e){
                    e.preventDefault()
                    console.log(item.id)
                    let data = item.data()
                    data.approved = true
                    db.collection('users').doc(item.id).update(data)
                    .then((res)=>{
                        console.log("Done")
                    })
                }
                return(
                    <div>
                    <li key={item.data().email}>{item.data().name + "," + item.data().cnic}</li>
                    <button onClick={handleChange}>Approve</button>
                    </div>
                )
            })}
            </div>
        </div>
    )
}

export default ApproveReq