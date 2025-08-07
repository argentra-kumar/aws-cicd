# Use Node.js 22 LTS Alpine image
FROM node:22-alpine

# Create app directory
WORKDIR /app

# Copy dependency files
COPY package.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install --production

# Copy the rest of the application
COPY . .

# Build the NestJS application
RUN yarn build

# Expose the application port (adjust if needed)
EXPOSE 3000

# Start the NestJS app
CMD ["node", "dist/main"]
