.PHONY: build clean image

build:
	go build -o myapp main.go

image:
	docker build -t myapp .

clean:
	rm -f myapp
