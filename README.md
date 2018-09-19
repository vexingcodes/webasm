# webasm

Docker development environment for playing with C++ WebAssembly using asm-dom.

# Usage

Run these commands to build and start the Docker container.

```
docker build . -t webasm
docker run -it --rm -p 1234:1234 webasm
```

Visit `http://localhost:1234` in your browser.
