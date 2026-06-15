import axios from "axios";
export const axiosi = axios.create({
  withCredentials: true,
  baseURL: "http://100.26.232.72:8000"
});
