# Sets Node.js 20 on Alpine Linux as the lightweight base environment
FROM node:20-alpine

# Sets the working directory inside the container for all subsequent commands
WORKDIR /app

# Copies package configuration files first to optimize Docker layer caching
COPY package*.json ./

# Installs production dependencies strictly matching package-lock.json
RUN npm ci --omit=dev

# Copies remaining application source code into the working directory
COPY . .

# Switches from root to a non-privileged user for enhanced container security
USER node

# Exposes container port 3000 to document network traffic interfaces
EXPOSE 3000

# Sets the runtime environment variable to production
ENV NODE_ENV=production

# Sets the default executable command to run when starting the container
CMD ["npm", "start"]