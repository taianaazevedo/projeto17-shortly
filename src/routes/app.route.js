import { Router } from "express";
import routeAuth from "./auth.route.js";
import routeRanking from "./ranking.route.js";
import routeUrl from "./urls.route.js";
import routeUser from "./users.route.js";

const routes = Router();

routes.use(routeAuth);
routes.use(routeUrl);
routes.use(routeRanking);
routes.use(routeUser);


export default routes;
