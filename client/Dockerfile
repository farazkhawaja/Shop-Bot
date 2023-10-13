# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app for production
 
# Expose the port where the app will run (typically 3000 for Create React App)
EXPOSE 3000

# Start the React app when the container starts
CMD ["npm", "start","&"]
