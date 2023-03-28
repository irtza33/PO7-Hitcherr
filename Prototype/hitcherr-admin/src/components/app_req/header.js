import React from 'react';
import { slide as Menu } from 'react-burger-menu';
import firebase from "firebase";


export default props => {


    const logOut = () => {
        firebase.auth().signOut().then(function() {
            console.log("signout successful")
            window.location = '/' 
          }).catch(function(error) {
            // An error happened.
          });
    }

  return (
    <Menu>

<a className="menu-item" href="/approve_requests">
        Pending Requests
      </a>

      <a className="menu-item" href="/current_rides">
        OnGoing Rides
      </a>

      <a className="menu-item" onClick={logOut} style={{cursor:'pointer'}}>
        LogOut
      </a>
    </Menu>
  );
};