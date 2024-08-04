# Build stage
FROM node:14-alpine3.16 as build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the client application code to the working directory
COPY ./ ./

# Build the application and remove development dependencies
RUN npm run build && \
    npm prune --production

# Production stage
FROM node:14-alpine3.16 as production-stage

WORKDIR /app

COPY --from=build /app /app

ENV NODE_ENV=production

RUN npm install -g serve

EXPOSE 3000

CMD ["sh"]  
# For debugging, replace this with ["serve", "-s", "build"] after fixing issues

