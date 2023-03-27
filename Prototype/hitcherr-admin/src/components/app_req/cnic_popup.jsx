import './popup.css';
import React, { useEffect, useState } from "react";
import {AiOutlineCloseSquare} from"react-icons/ai";
import { db } from '../../firebase';
import Popup from './popup'


const CnicPopup = ({setCnicPopup}) => {


    
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
                width:'600px',
                height:'500px',
                padding:'20px,10px',
            }}
                
            >

            {/*top*/}
            <div style={{borderBottom:"1px solid lightgray", paddingBottom:"10px"}} >
                <h1 style={{ width:"300px", margin:45, alignItems:"center", fontSize:"75px", position:"relative", left:"170px"}}>CNIC</h1>
            </div>
            <div 
                style={{cursor: "pointer",position:"absolute", top:10, right:10, }}
                onClick = {setCnicPopup.bind(this, false)}
                >
                <AiOutlineCloseSquare/>
            </div>

            {/*Add images here*/}
            <div className={'d-flex align-items-center '} style={{marginLeft:20, marginRight:20}}>
            <div>
                {/*Image 1 here*/}
            <img src={localStorage.getItem("cnic1")} height={170} width = {275} style={{borderRadius:20}}></img>
            </div>

            <div style={{margin:10}}>
                {/*Image 2 here*/ }
                <img src={localStorage.getItem("cnic2")} height={170} width = {275} style={{borderRadius:20}}></img>
            </div>
            
            </div>
            <div style={{borderBottom:"1px solid lightgray", paddingBottom:"10px"}} >
                
            </div>
            {/*Add Cnic description here*/}
            <div className={'d-flex align-items-center '} style={{marginLeft:75, marginRight:75}} >
                <div>
                    <h4>CNIC back side</h4>
                </div>
                <div style={{marginLeft:120}}>
                <h4>CNIC front side</h4>
                </div>
                </div>
            </div>
            </div>
    )
}

export default CnicPopup;