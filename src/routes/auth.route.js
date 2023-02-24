import { Router } from "express";

const routeAuth = Router();

routeAuth.post("/signin");
routeAuth.post("/signup");

export default routeAuth;
