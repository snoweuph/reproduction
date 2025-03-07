build:
	docker build -t reproduction .
	docker run --rm -it -v "$$(pwd):/app:Z" reproduction
	wine target/x86_64-pc-windows-gnu/release/reproduction.exe
