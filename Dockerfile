# Use official Maven image with JDK 8 installed
FROM maven:3.8.7-openjdk-8

# Set working directory inside the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Optional: Download dependencies (faster builds)
RUN mvn dependency:resolve

# Compile the project, skipping tests
RUN mvn clean compile -DskipTests

# Default command if someone runs the container
CMD ["mvn", "test"]
