# Використовуємо базовий образ Golang від Quay.io
FROM quay.io/projectquay/golang:1.20 as builder

WORKDIR /app
COPY . .

# Збірка програми
RUN GOOS=linux GOARCH=amd64 go build -o app-linux-amd64 .
RUN GOOS=linux GOARCH=arm64 go build -o app-linux-arm64 .
RUN GOOS=darwin GOARCH=amd64 go build -o app-darwin-amd64 .
RUN GOOS=darwin GOARCH=arm64 go build -o app-darwin-arm64 .
RUN GOOS=windows GOARCH=amd64 go build -o app-windows-amd64.exe .
RUN GOOS=windows GOARCH=arm64 go build -o app-windows-arm64.exe .

FROM scratch
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH

# Копіювання бінарного файлу в scratch контейнер
COPY --from=builder /app/app-$TARGETOS-$TARGETARCH /app

CMD ["/app"]

