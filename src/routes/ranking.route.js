import { Router } from "express";
import { getRanking } from "../controllers/ranking.controller.js";

const routeRanking = Router();

routeRanking.get("/ranking", getRanking);

export default routeRanking;
