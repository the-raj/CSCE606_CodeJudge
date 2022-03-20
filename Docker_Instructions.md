Instructions to run the docker container:

1: Install Docker.

2: Switch to the app directory (you're already here)

3: run ```
docker-compose build
```

If this returns an error, make sure Docker is running.

4: run ```
docker-compose run web rails db:create
```

5: run ```
docker-compose up
```

Your container is now running!
Go to localhost:3000 (or the specified port) to interact with the page.

If you want to create the container from scratch later, run
```
docker-compose down -v
```

More info: https://www.codewithjason.com/dockerize-rails-application/
