# Використання офіційного образу Golang як базового образу для збірки
FROM golang:1.16 as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o myapp main.go

# Налаштування остаточного образу, який використовуватиметься для запуску додатку
FROM debian:buster
COPY --from=builder /app/myapp /app/myapp
WORKDIR /app
CMD ["./myapp"]
