# Етап 1: Збирання за допомогою офіційного образу Go
FROM golang:1.16 as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN make build

# Етап 2: Налаштування фінального образу
FROM debian:buster
COPY --from=builder /app/myapp /app/myapp
WORKDIR /app
CMD ["./myapp"]
