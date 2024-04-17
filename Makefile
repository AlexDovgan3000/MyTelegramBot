.PHONY: build clean

build:
	go build -o myapp main.go

clean:
	rm -f myapp
