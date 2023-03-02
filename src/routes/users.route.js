import { Router } from "express";
import { getUsers } from "../controllers/users.controller.js";

const routeUser = Router();

routeUser.get("/users/me", getUsers);

export default routeUser;
