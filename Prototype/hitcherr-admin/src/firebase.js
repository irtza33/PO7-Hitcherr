// Import the functions you need from the SDKs you need
// import { initializeApp } from 'firebase/app';
// import {getAuth} from 'firebase/auth';
import 'firebase/firestore'
import firebase from 'firebase'

console.log(firebase.default.auth)

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAc60Gj6C3UTSGo-SuMg-qciwNHZi_1hcc",
  authDomain: "ride-sharing-app-2a212.firebaseapp.com",
  projectId: "ride-sharing-app-2a212",
  storageBucket: "ride-sharing-app-2a212.appspot.com",
  messagingSenderId: "1014545052852",
  appId: "1:1014545052852:web:a13726460fb0bc579693e1"
};

// Initialize Firebase
const app = firebase.default.initializeApp(firebaseConfig);
const auth = firebase.default.auth(app);
const db = firebase.firestore();
export {auth, db}