import React from "react";
import { Navigate } from "react-router-dom";

// Authentication related pages
import Login from "../components/Authentication/Login";

const authProtectedRoutes = [
 

  {
    path: "/",
    exact: true,
    component: <Navigate to="/dashboard" />,
  },
];

const publicRoutes = [
  { path: "/login", component: <Login /> },

];

export { authProtectedRoutes, publicRoutes };
