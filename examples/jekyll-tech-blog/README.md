# jekyll-tech-blog

A simple example built from the template for production and development mode.

Deployed with [Netlify](https://www.netlify.com/) at https://jekyll-tech-blog.netlify.app:
- source code: see the Git branch [branch:main](https://github.com/glegoux/jekyll-tech-blog/tree/main) 
- static files: not available because built server-side, but you can rebuild and see it locally by running
at the repository root for production mode `make build-prod` and for development mode with `make build`, the result
will be in the `./build/static-files` folder. Go to this folder and run: `../bin/static-http-server.sh` (or use `make run-prod` and `make run` directly).
