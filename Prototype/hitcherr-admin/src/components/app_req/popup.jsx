import './popup.css'
import {AiOutlineCloseSquare} from"react-icons/ai";
import React, { useEffect, useState } from "react";
import CnicPopup from './cnic_popup'
import { db } from '../../firebase';
import CarPopup from './car_popup'


const Popup = ({setPopup}) => {
    let flag = false;
    const [CnicPopupOpen, setCnicPopup] = useState(false);
    const [CarPopupOpen, setCarPopup] = useState(false);


    const [cnic, setCnic] = useState([])
    
    const [drivers, setDrivers] = useState([])
    //try {console.log(drivers[4].id)} catch {}

    let temp = []

    const getDrivers = async ()=>{ //Do processing in popuo not her
        flag = false;
        const DriverData = db.collection('Drivers')
                    .get()
                    .then((res)=>{
                        res.forEach((item)=>{
                        temp.push(item)
                        })
                        setDrivers(temp)
                    }).then(() => {
                            temp.forEach((driver,idx) => {
                            if (driver.id == localStorage.getItem("detail")) {
                                console.log("HERE")

                                flag = true;
                                console.log(localStorage.getItem("detail"))
                                console.log(driver.id)
                                console.log("FOUND")
                                let driverData = driver.data();
                                let temp = [];
                                let car = [];
                                car[0] = driverData.car_back;
                                car[1] = driverData.car_front;
                                car[2] = driverData.car_interior;
                                car[3] = driverData.car_left;
                                car[4] = driverData.car_right;
                                car[5] = driverData.carname;
                                car[6] = driverData.color;
                                car[7] = driverData.license;
                                car[8] = driverData.manufacturer;
                                car[9] = driverData.model;
                                localStorage.setItem("back", car[0])
                                localStorage.setItem("front", car[1])
                                localStorage.setItem("interior", car[2])
                                localStorage.setItem("left", car[3])
                                localStorage.setItem("right", car[4])
                                localStorage.setItem("name", car[5])
                                localStorage.setItem("color", car[6])
                                localStorage.setItem("license", car[7])
                                localStorage.setItem("manufacturer", car[8])
                                localStorage.setItem("model", car[9])
                
                
                                temp[0] = driverData.cnic_back;
                                temp[1] = driverData.cnic_front;
                                localStorage.setItem("cnic1", temp[0])
                                localStorage.setItem("cnic2", temp[1])
                                setCnic(temp);
                            }
                        }) 
                    }).then(() => {
                        if (!flag) {
                            localStorage.setItem("back", "")
                            localStorage.setItem("front", "")
                            localStorage.setItem("interior", "")
                            localStorage.setItem("left", "")
                            localStorage.setItem("right", "")
                            localStorage.setItem("name", "")
                            localStorage.setItem("color", "")
                            localStorage.setItem("license", "")
                            localStorage.setItem("manufacturer", "")
                            localStorage.setItem("model", "")
                            localStorage.setItem("cnic1", "")
                            localStorage.setItem("cnic2", "")
                        }
                    })

            
        
        


    }

    function doIt(e) {
        //e.preventDefault();
        getDrivers()
        
        setCnicPopup.bind(this,true)()
    }

    function doIt1(e) {
        //e.preventDefault();
        getDrivers()
        
        setCarPopup.bind(this,true)()
    }

   useEffect(()=>{
    getDrivers()
    }
    ,[])
    
    return (    
        <div style = {{
                position:'fixed',
                background:'rgb(0,0,0,0.35)',
                top:0,
                left:0,
                right:0,
                bottom:0,
                display: 'flex',
                alignItems:'center',
                justifyContent:'center',
            }}
        >
            {/*middle*/}
            <div style = {{
                position:'relative',
                background:'white',
                borderRadius:'8px',
                width:'250px',
                padding:'20px,10px',
            }}
                
            >

            {/*top*/}
            <div style={{borderBottom:"1px solid lightgray", paddingBottom:"10px"}} >
                <h1 style={{ width:"200px", marginLeft:20,margin:25, alignItems:"center"}} className={'d-flex align-items-center '} >Documents</h1>
            </div>
            <div 
                style={{cursor: "pointer",position:"absolute", top:10, right:10, }}
                onClick = {setPopup.bind(this, false)}
                >
                <AiOutlineCloseSquare/>
            </div>

            {/*Add buttons here*/}
            <div>
                <button className={"button"} style={{position:"relative", width:"250px"}} onClick={doIt} >CNIC</button>

            </div>
            <div>
                <button className={"button"} style={{position:"relative", width:"250px"}} onClick={doIt1} >Car Details</button>
            </div>
            </div>
            {CnicPopupOpen && <CnicPopup setCnicPopup={setCnicPopup} />}
            {CarPopupOpen && <CarPopup setCarPopup={setCarPopup} />}


            </div>
            
    )
}

export default Popup;