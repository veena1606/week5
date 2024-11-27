
# Step 1: Use the official Node.js image from Docker Hub as the base image
FROM node:14

# Step 2: Set the working directory in the container
WORKDIR /usr/src/app

# Step 3: Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Step 4: Install the dependencies (npm install)
RUN npm install

# Step 5: Copy the rest of the application code into the container
COPY . .

# Step 6: Expose the port your app will run on (this should match the app's listen port)
EXPOSE 3000

# Step 7: Define the command to run your app (start the Node.js server)
CMD ["node", "App.js"]
