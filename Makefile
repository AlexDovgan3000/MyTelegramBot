.PHONY: linux-arm64 linux-amd64 darwin-amd64 darwin-arm64 windows-amd64 windows-arm64 clean

linux-arm64:
	docker buildx build --platform linux/arm64 -t myapp-linux-arm64 .

linux-amd64:
	docker buildx build --platform linux/amd64 -t myapp-linux-amd64 .

darwin-amd64:
	docker buildx build --platform darwin/amd64 -t myapp-darwin-amd64 .

darwin-arm64:
	docker buildx build --platform darwin/arm64 -t myapp-darwin-arm64 .

windows-amd64:
	docker buildx build --platform windows/amd64 -t myapp-windows-amd64 .

windows-arm64:
	docker buildx build --platform windows/arm64 -t myapp-windows-arm64 .

clean:
	docker rmi myapp-linux-arm64 myapp-linux-amd64 myapp-darwin-amd64 myapp-darwin-arm64 myapp-windows-amd64 myapp-windows-arm64

