# Use official Maven image with JDK 8 installed
FROM maven:3.8.7-eclipse-temurin-8

# Set working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Optional: Resolve dependencies first (faster incremental builds)
RUN mvn dependency:resolve

# Compile the project (skip tests)
RUN mvn clean compile -DskipTests

# Default command
CMD ["mvn", "test"]
