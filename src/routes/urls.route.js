import { Router } from "express";

const routeUrl = Router();

routeUrl.post("/urls/shorten");
routeUrl.get("urls/:id");
routeUrl.get("urls/open/:shortUrl");
routeUrl.delete("/urls/:id");

export default routeUrl;
