# Use lightweight Node image
FROM node:18-alpine

WORKDIR /app

# Install dependencies first (better caching)
COPY package*.json ./
RUN npm install --production

# Copy source code
COPY . .

# App runs on this port (adjust if different in index.js)
EXPOSE 8000

# Start backend
CMD ["npm", "start"]
