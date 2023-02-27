import { Router } from "express";
import { signUp } from "../controllers/auth.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { signUpSchema } from "../schemas/authSchema.js";


const routeAuth = Router();

routeAuth.post("/signin");
routeAuth.post("/signup", validateSchema(signUpSchema), signUp);

export default routeAuth;
