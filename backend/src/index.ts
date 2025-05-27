import { db } from "./lib/database";
import express, { type Request, type Response } from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const allowedOrigins = [process.env.CLIENT_ORIGIN || "http://localhost:3001"];

app.use(
  cors({
    origin: allowedOrigins,
    credentials: true, // if you want to allow cookies/auth headers
  })
);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", async (req: Request, res: Response) => {
  const users = await db.user.findMany();
  res.json(users);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
