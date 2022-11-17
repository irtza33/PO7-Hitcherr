import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import {signInWithEmailAndPassword, sendEmailVerification} from 'firebase/auth'
import firebase from "firebase";
import App from "../../App";

const ApproveReq = () =>
{
    const [users, setUsers] = useState([])

    const getUser = async ()=>{
        const data = db.collection('users').where("approved","==",false)
                    .get()
                    .then((res)=>{
                        console.log(res)
                        setUsers([])
                        res.forEach((item)=>{
                            users.push(item.data())
                        })
                        console.log(users)
                    })
    }

    useEffect(()=>{
        getUser()
    }
        ,[])

    return (
        <div id="App">
            <h1>App Req</h1>
            {users.map((item)=>{
                return(
                    <div>
                    <li>{item.name}</li>
                    <button>Approve</button>
                    </div>
                )
            })}
        </div>
    )
}

export default ApproveReq