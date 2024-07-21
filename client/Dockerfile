# Build stage
FROM node:14-alpine3.16 AS build_stage

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY client/package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the client application code to the working directory
COPY . .

# Build the application and remove development dependencies
RUN npm run build && \
    npm prune --production

# Production stage
FROM node:16-alpine3.16 AS production_stage

# Set the working directory inside the container
WORKDIR /app

# Install `serve` to serve the built files
RUN npm install -g serve

# Copy the built app from the build stage to the production container
COPY --from=build_stage /app /app

# Expose port 3000 to communicate with the outside world
EXPOSE 3000

# Command to start the application
CMD ["serve", "-s", "build"]
