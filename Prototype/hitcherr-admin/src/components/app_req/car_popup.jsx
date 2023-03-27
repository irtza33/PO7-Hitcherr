import './popup.css';
import React, { useEffect, useState } from "react";
import {AiOutlineCloseSquare} from"react-icons/ai";
import { db } from '../../firebase';
import Popup from './popup'


const CarPopup = ({setCarPopup}) => {


    
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
                width:'1000px',
                height:'800px',
                padding:'20px,10px',
            }} 
                
            >

            {/*top*/}
            <div style={{borderBottom:"1px solid lightgray", paddingBottom:"10px"}} >
                <h1 style={{ width:"300px", margin:35, alignItems:"center", fontSize:"50px", position:"relative", left:"350px"}}>Car Details</h1>
            </div>
            <div 
                style={{cursor: "pointer",position:"absolute", top:10, right:10, }}
                onClick = {setCarPopup.bind(this, false)}
                >
                <AiOutlineCloseSquare/>
            </div>

            {/*Add images here*/}
            <div className={'d-flex align-items-center justify-content-between'} style={{marginLeft:30, marginRight:30}}>
            <div>
                {/*Image 1 here*/}
            <img src={localStorage.getItem("back")} height={170} width = {275} style={{borderRadius:20}} id={"1"}></img>
            <label for={"1"}>
                <h4 style={{marginLeft:80}} >Back side</h4>
                </label>
            
            </div>

            <div style={{margin:20}}>
                {/*Image 2 here*/ }
                <img src={localStorage.getItem("front")} height={170} width = {275} style={{borderRadius:20}} id = {"2"}></img>
                <label for={"2"}>
                <h4 style={{marginLeft:80}} >Front side</h4>
                </label>
            </div>

            <div style={{margin:0}}>
                {/*Image 3 here*/ }
                <img src={localStorage.getItem("interior")} height={170} width = {275} style={{borderRadius:20}} id = {"3"}></img>
                <label for={"3"}>
                <h4 style={{marginLeft:90}} >Interior</h4>
                </label>
            </div>
            
            </div>
            <div style={{borderBottom:"1px solid lightgray", paddingBottom:"10px"}} >
                
            </div>


            {/*Add images here*/}
            <div className={'d-flex align-items-center justify-content-between'} style={{marginLeft:30, marginRight:30}}>
            <div>
                {/*Image 1 here*/}
            <img src={localStorage.getItem("left")} height={170} width = {275} style={{borderRadius:20}} id={"4"}></img>
            <label for={"4"}>
                <h4 style={{marginLeft:80}} >Left side</h4>
                </label>
            
            </div>

            <div style={{margin:20}}>
                {/*Image 2 here*/ }
                <img src={localStorage.getItem("right")} height={170} width = {275} style={{borderRadius:20}} id = {"5"}></img>
                <label for={"5"}>
                <h4 style={{marginLeft:80}} >Right side</h4>
                </label>
            </div>

            <div style={{margin:0}}>
                {/*Image 3 here*/ }
                <img src={localStorage.getItem("licenser")} height={170} width = {275} style={{borderRadius:20}} id = {"6"}></img>
                <label for={"6"}>
                <h4 style={{marginLeft:90}} >License</h4>
                </label>
            </div>
            
            </div>
            <div style={{borderBottom:"1px solid lightgray", paddingBottom:"10px"}} >
                
            </div>

            <div className={'d-flex align-items-center justify-content-between'} >
            <table className={"table"} >
                <tr>
                <th  className={"th"} >Car Name</th>
                <th className={"th"} >Manufacturer</th>
                <th className={"th"}>Color</th>
                <th  className={"th"}>Model</th>
                </tr>
                <tr>
                <td className={"td"}>{localStorage.getItem("name")}</td>
                <td className={"td"}>{localStorage.getItem("manufacturer")}</td>
                <td className={"td"}>{localStorage.getItem("color")}</td>
                <td className={"td"}>{localStorage.getItem("model")}</td>

                </tr>
            </table>
            </div>
            

            
            </div>



            

            </div>
    )
}

export default CarPopup;