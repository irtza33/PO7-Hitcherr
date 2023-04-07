import React, { useEffect, useState } from "react";
import { auth, db } from "../../firebase";
import '../app_req/app_req.css'
import firebase from "firebase";
import img from '../../assets/Hitcherr_logo.png'
import styles from '../app_req/app_req.module.scss'
import SideBar from '../app_req/header';
import '../app_req/header.css';
import './ongoing.css'
import './SOS.css'
import LoadingSpinner from "../login/LoadingSpinner";




const OnGoing = () =>
{
    const [rides, setRides] = useState([])
    const [isLoading, setIsLoading] = useState(false);

    const getRides = async ()=>{
        const data = db.collection('Rides').where("status","==",2)
                    .get()
                    .then((res)=>{
                        let temp = []
                        res.forEach((item)=>{
                           temp.push(item)
                        })
                        setRides(temp)
                    })
        
    }

    
    useEffect(()=>{
        getRides()
    }
        ,[])


    return (
       <div>
            <SideBar/>
           <div className={'d-flex align-items-center '}>
               <div style={{marginLeft:140}}>
                <img className={styles.logo} src={img} alt="logo" />
                </div>
                <div className="container" style={{marginLeft:0}}>
                    <h1 className="text-light text-start m-0 ms-3">OnGoing Rides</h1>
                </div>
                
            </div>
           {!isLoading ? <div className={"container " + styles.card_container}>
                <div className="d-flex flex-wrap" style={{marginRight:60}}>  
                     {rides.map((item)=>{
            
                    
                        function resolve(e) {
                            
                           // e.preventDefault()
                            setIsLoading(true)
                            let data = item.data()
                            data.SOS = false
                            db.collection('Rides').doc(item.id).update(data).then((res) => {
                                //setIsLoading(false)
                                window.location='./current_rides'
                            })
                        }

                        
                            

                        return(
                            <div
                                //onClick={setPopup.bind(this,false)}

                                className={"container bg-dark m-3 rounded-3 shadow-lg " + styles.card} style={{width:1000}}>

                                <div className="container text-light fs-5 d-flex justify-content-evenly" >
                                

                                    <div  className={"center"}>
                                    <div className="mt-4">
                                        <h4 className={"fs-6 mx-3 " + styles.card_title}>Driver's name:</h4>
                                        <p className="fs-6 mx-3">{item.data().driver_name}</p>
                                        <h4 className={"fs-6 mx-3 " + styles.card_title}>Client's name:</h4>
                                        <p className="fs-6 mx-3">{item.data().user_name}</p>
                                        
                                    </div>
                                    </div>

                                    <div className={"center"}>
                                
                                    <div className="mt-4">
                                        <h4 className={"fs-6 mx-3 " + styles.card_title}  >Pickup:</h4>
                                        <p className="fs-6 mx-3">{item.data().pick_up}</p>
                                        <h4 className={"fs-6 mx-3 " + styles.card_title}>Dropoff:</h4>
                                        <p className="fs-6 mx-3">{item.data().drop_off}</p>
                                        
                                    </div>
                                    </div>
                                    
                                </div>
                                {(item.data().SOS && <div className="red" onClick={resolve}> <h1>SOS</h1> </div>) || (!item.data().SOS && <div className="green" > <h1>ACTIVE</h1> </div>)}
                                    
                            </div>
                        )
                    })}
                </div>
            </div> : <LoadingSpinner/>}
        </div>
    )
}

export default OnGoing