# syntax=docker/dockerfile:1

FROM golang:1.16-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o gex main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/gex ./gex
COPY --from=builder /app/screenshot.png ./screenshot.png
COPY --from=builder /app/readme.md ./readme.md
COPY --from=builder /app/LICENSE ./LICENSE
# Set environment variable for terminal support
ENV TERM xterm-256color
CMD ["/app/gex"] 