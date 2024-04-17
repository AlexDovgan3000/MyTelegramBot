.PHONY: linux-amd64 linux-arm64 darwin-amd64 darwin-arm64 windows-amd64 windows-arm64 clean

all: linux-amd64 linux-arm64 darwin-amd64 darwin-arm64 windows-amd64 windows-arm64

linux-amd64:
	@echo "Building for Linux AMD64"
	docker build --platform=linux/amd64 -t myapp-linux-amd64 .

linux-arm64:
	@echo "Building for Linux ARM64"
	docker build --platform=linux/arm64 -t myapp-linux-arm64 .

darwin-amd64:
	@echo "Building for Darwin AMD64"
	docker build --platform=darwin/amd64 -t myapp-darwin-amd64 .

darwin-arm64:
	@echo "Building for Darwin ARM64"
	docker build --platform=darwin/arm64 -t myapp-darwin-arm64 .

windows-amd64:
	@echo "Building for Windows AMD64"
	docker build --platform=windows/amd64 -t myapp-windows-amd64 .

windows-arm64:
	@echo "Building for Windows ARM64"
	docker build --platform=windows/arm64 -t myapp-windows-arm64 .

clean:
	@echo "Removing Docker images..."
	-docker rmi -f myapp-linux-arm64:latest || true
	-docker rmi -f myapp-linux-amd64:latest || true
	-docker rmi -f myapp-darwin-amd64:latest || true
	-docker rmi -f myapp-darwin-arm64:latest || true
	-docker rmi -f myapp-windows-amd64:latest || true
	-docker rmi -f myapp-windows-arm64:latest || true


