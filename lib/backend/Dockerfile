# Use the official Golang image as the base image
FROM golang:1.27 AS builder
# Set the working directory inside the container
WORKDIR /app
# Copy go.mod and go.sum files to download dependencies
COPY go.mod go.sum ./
RUN go mod download
# Copy the source code into the container
COPY . .
# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux go build -o server ./cmd/app
# Use a minimal base image for production
FROM alpine:3.21
# Set working directory in the minimal image
WORKDIR /app
COPY --from=builder /app/server ./server
# Copy the compiled binary from the builder stage
# Expose the port your application listens on
EXPOSE 8080
# Command to run the application
CMD ["./server"]