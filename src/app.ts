import express from "express";
import { userRoutes } from "./routes";

class App {
  public server;

  constructor() {
    this.server = express();

    this.middlewares();
    this.routes();
  }

  middlewares() {
    this.server.use(express.json());
  }

  routes() {
    this.server.use("/api/users", userRoutes);
  }
}

export default new App().server;
