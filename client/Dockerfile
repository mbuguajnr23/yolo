# Build stage
FROM node:16-alpine3.16 as build-stage

# Set the working directory inside the container
WORKDIR /client

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Production stage
FROM node:16-alpine3.16 as production-stage

WORKDIR /client

# Copy only the built files from the build stage
COPY --from=build-stage /client/build ./build

# Set the environment variable for the app
ENV NODE_ENV=production

# Install a lightweight HTTP server to serve the built files
RUN npm install -g serve

# Expose the port used by the app
EXPOSE 3000

# Command to serve the built application
CMD ["serve", "-s", "build"]
