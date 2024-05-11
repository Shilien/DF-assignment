* Docker

** Write a dockerfile for a basic sample application in a language of your choice.

** How to test locally

1. Make sure you have installed docker.
`docker ps`
2. Build the image
`docker build . -t docker_test`
3. Run the container
`docker run -d -p 8888:8888/tcp docker_test`
4. Access the url via expose port
[App URL](http://localhost:8888/cgi-bin/app.py)

