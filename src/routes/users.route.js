import { Router } from "express";

const routeUser = Router();

routeUser.get("/users/me");

export default routeUser;
