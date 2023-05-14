# Stage 1: Build the application
FROM ubuntu:latest AS build

# Install build dependencies
RUN apt-get update && apt-get install -y build-essential

# Copy the source code
COPY . /app

# Build the application
WORKDIR /app
RUN make

# Stage 2: Create the production image
FROM ubuntu:latest AS production

# Create a non-root user
RUN useradd --create-home --shell /bin/bash appuser

# Install runtime dependencies
RUN apt-get update && apt-get install -y libssl-dev

# Copy the binary from the build stage
COPY --from=build /app/myapp /usr/local/bin/myapp

# Set environment variables
ENV MYAPP_PORT 8080
ENV MYAPP_DEBUG false

# Use a minimal base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the binary from the production stage
COPY --from=production /usr/local/bin/myapp /app/myapp

# Run the application as the non-root user
USER appuser

# Set resource limits
CMD ["/app/myapp", "-p", "${MYAPP_PORT}", "-d", "${MYAPP_DEBUG}"]
