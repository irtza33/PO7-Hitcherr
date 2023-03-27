import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import {signInWithEmailAndPassword, sendEmailVerification} from 'firebase/auth'
import './app_req.css'
import firebase from "firebase";
import App from "../../App";
import img from '../../assets/Hitcherr_logo.png'
import styles from './app_req.module.scss'
import Popup from './popup'
import './popup.css'



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
        ,[])


    const [PopupOpen, setPopup] = useState(false);

    const logOut = () => {
        firebase.auth().signOut().then(function() {
            console.log("signout successful")
            window.location = '/'
          }).catch(function(error) {
            // An error happened.
          });
    }

    return (
        <div>
           <div className={'d-flex align-items-center '}>
                <img className={styles.logo} src={img} alt="logo" />
                <div className="container">
                    <h1 className="text-light text-start m-0 ms-3">Pending Requests</h1>
                </div>
                <div className="Lbutton" style={{cursor:"pointer", width:100}} onClick={logOut}>
                    Log Out
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
                            }).then((res) => {
                                getUser()
                            })
                        }

                        function viewDetails(e){
                            e.preventDefault()
                            setPopup.bind(this, true)()
                            console.log(item.id)
                            console.log("Sent to local store")
                            localStorage.setItem("detail", item.id)
                        }

                        
                            

                        return(
                            <div 
                                //onClick={setPopup.bind(this,false)}

                                className={"container bg-dark m-3 rounded-4 shadow-lg " + styles.card}>

                                <div className="container text-light fs-5 d-flex justify-content-evenly">
                                    <div className="mt-4">
                                        <h2 className={"fs-6 mx-3 " + styles.card_title}>USERNAME:</h2>
                                        <h2 className="fs-5 mx-3">{item.data().name}</h2>
                                        <h2 className={"fs-6 mx-3 " + styles.card_title}>EMAIL:</h2>
                                        <h2 className="fs-5 mx-3">{item.data().email}</h2>
                                    </div>
                                    <div className="mt-4">
                                        <h2 className={"fs-6 mx-3 " + styles.card_title}>PHONE:</h2>
                                        <h2 className="fs-5 mx-3">{item.data().phone}</h2>
                                        <h2 className={"fs-6 mx-3 " + styles.card_title}>CNIC:</h2>
                                        <h2 className="fs-5 mx-3">{item.data().cnic}</h2>
                                        
                                    </div>
                                </div>
                                <div className="d-flex justify-content-center mt-4 mb-4">
                                    <button onClick={handleChange} className='btn btn-light'>Approve</button>
                                </div>
                                <div className="d-flex justify-content-center mt-4 mb-4">
                                    <button onClick={viewDetails} className='btn btn-light'>View Details</button>
                                    {PopupOpen && <Popup setPopup={setPopup} />}
                                    
                                
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