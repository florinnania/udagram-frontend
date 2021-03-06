## Use ionic base image
FROM beevelop/ionic AS ionic

# Create app directory in Docker
WORKDIR /usr/src/app

# Install app dependencies by copying
#package.json and package-lock.json
COPY package*.json ./

# Install dependencies in Docker
RUN npm ci

# Copy app from local environment into the Docker image
COPY . .

RUN ionic build

## Run 
FROM nginx:alpine
#COPY www /usr/share/nginx/html
COPY --from=ionic /usr/src/app/www /usr/share/nginx/html