import axios from "axios";
export const axiosi = axios.create({
  withCredentials: true,
  baseURL: "http://100.26.238.103:8000"
});
