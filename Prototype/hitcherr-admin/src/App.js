// import logo from './logo.svg';
import './App.css';
import {Route, Routes, useNavigation} from "react-router-dom";
import Login from './components/login/login';
import ApproveReq from './components/app_req/app_req';

function App() {
  return (
    <Routes>
        <Route path = '/' element = {<Login />}></Route>
        <Route path='/approve_requests' element={<ApproveReq />}></Route>
    </Routes>
  );
}

export default App;
