import { Router } from "express";
import {validateSchema} from "../middlewares/validateSchema.middleware.js"
import { urlSchema } from "../schemas/urlsSchema.js";
import { createShortUrl, getUrlById } from "../controllers/urls.controller.js";

const routeUrl = Router();

routeUrl.post("/urls/shorten", validateSchema(urlSchema), createShortUrl);
routeUrl.get("/urls/:id", getUrlById);
routeUrl.get("/urls/open/:shortUrl");
routeUrl.delete("/urls/:id");

export default routeUrl;
