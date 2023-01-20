import { Router } from "express";
import { userController } from "../controllers/user.controlllers";

const routes = Router();

routes.get("/", userController.index);

routes.post("/create", userController.createUser);

routes.get("/id:", userController.findUniqueUser);

routes.put("/:id", userController.createUser);

routes.delete("/id:", userController.deleteUser);

export default routes;
