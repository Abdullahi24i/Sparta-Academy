# Use a lightweight Node.js image
FROM node:20-slim

# Set the working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Install app dependencies
RUN npm install

# Expose ports
EXPOSE 80 3000

# Start services using JSON CMD format
CMD ["npm", "start"]

# docker build -t sparta-app .  # to build
# docker run -p 80:80 -p 3000:3000 sparta-app  # to run the app
