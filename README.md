# Unduck

DuckDuckGo's bang redirects are too slow. Add the following URL as a custom search engine to your browser. Enables all of DuckDuckGo's bangs to work, but much faster.

```
https://unduck.link?q=%s
```

## How is it that much faster?

DuckDuckGo does their redirects server side. Their DNS is...not always great. Result is that it often takes ages.

I solved this by doing all of the work client side. Once you've went to https://unduck.link once, the JS is all cache'd and will never need to be downloaded again. Your device does the redirects, not me.

## Docker Setup

This application can be run as a Docker container. The setup includes a multi-stage build that compiles the Vite app and serves it with nginx.

### Quick Start

1. **Build and run with Docker Compose:**
   ```bash
   docker-compose up --build
   ```
   The app will be available at http://localhost:3000

2. **Build and run with Docker directly:**
   ```bash
   # Build the image
   docker build -t unduck .
   
   # Run the container
   docker run -d -p 3000:80 --name unduck-app unduck
   ```

3. **Use the convenience script:**
   ```bash
   ./docker-run.sh
   ```

### Docker Commands

- **Stop the container:**
  ```bash
  docker stop unduck-app
  ```

- **Remove the container:**
  ```bash
  docker rm unduck-app
  ```

- **View logs:**
  ```bash
  docker logs unduck-app
  ```

### Development

For development, you can still use the regular Vite dev server:
```bash
pnpm dev
```

The Docker setup is optimized for production deployment and includes:
- Multi-stage build for smaller image size
- Nginx for serving static files
- Gzip compression
- Proper caching headers
- Security headers
