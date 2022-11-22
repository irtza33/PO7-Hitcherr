import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import {signInWithEmailAndPassword, sendEmailVerification} from 'firebase/auth'
import firebase from "firebase";
import App from "../../App";
import img from '../../assets/Hitcherr_logo.png'
import styles from './app_req.module.scss'


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
        <div>
            <div className={'d-flex align-items-center '}>
                <img className={styles.logo} src={img} alt="logo" />
                <div className="container">
                    <h1 className="text-light text-start m-0">Pending Requests</h1>
                </div>
            </div>
            <div className={"container " + styles.card_container}>
                <div className="d-flex flex-wrap">  
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
                            <div className={"container bg-dark m-3 rounded-4 " + styles.card}>
                                <div className="container text-light fs-5 d-flex justify-content-evenly">
                                    <div>
                                        <h2 className="fs-5">{item.data().name}</h2>
                                        <h2 className="fs-5">{item.data().email}</h2>
                                    </div>
                                    <div>
                                        <h2 className="fs-5">{item.data().phone}</h2>
                                        <h2 className="fs-5">{item.data().cnic}</h2>
                                    </div>
                                </div>
                                <div className="d-flex justify-content-center mt-4 mb-4">
                                    <button onClick={handleChange} className='btn btn-light'>Approve</button>
                                </div>
                            </div>
                        )
                    })}
                </div>
            </div>
        </div>
    )
}

export default ApproveReq