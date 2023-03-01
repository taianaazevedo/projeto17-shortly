import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { signInSchema, signUpSchema } from "../schemas/authSchema.js";


const routeAuth = Router();

routeAuth.post("/signin", validateSchema(signInSchema), signIn);
routeAuth.post("/signup", validateSchema(signUpSchema), signUp);

export default routeAuth;
