# CSCE606_CodeJudge

## CSCE 606: Software Engineering Spring 2022 Course Project

### Team members

- [Karthik Mohan Raj](https://www.linkedin.com/in/the-raj)
- [Paul Schade](https://people.tamu.edu/~pascha/) (Scrum Master)
- Laren Spear
- Kathan Vyas (Product Owner)

### Client

- [Dr. Philip C. Ritchey](https://people.engr.tamu.edu/pcr/index.html)
  - [Calendly](https://calendly.com/pcr/15-min-office-hours-appointment)

### Project Links

- [PivotalTracker](https://www.pivotaltracker.com/n/projects/2555182)
- [Heroku Dashboard](https://dashboard.heroku.com/apps/csce606-codejudge)
- [Heroku App](https://csce606-codejudge.herokuapp.com)
- [Cucumber Dashboard](https://studio.cucumber.io/projects/317601)
-

### Installation instructions

<!-- First rename the file `.env.example` to `.env` and fill in the missing parameters from the Drive. -->

Download the [master.key](https://drive.google.com/file/d/1Ev6fz1ax5-DNLO8t26obGikVIG6K-t4T/view?usp=sharing) file and save it in the `config/` dirctory.

After that you can follow th next steps:

1. Install Docker.
2. Switch to the app directory (you're already here)
3. run

```sh
docker-compose build
```

If this returns an error, make sure Docker is running.

4. run

```sh
docker-compose run web rails db:create db:schema:load
```

5. run

```sh
docker-compose up
```

Your container is now running!
Go to localhost:3000 (or the specified port) to interact with the page.

If you want to create the container from scratch later, run

```sh
docker-compose down -v
```

More info: https://www.codewithjason.com/dockerize-rails-application/

To push to heroku

```sh
heroku container:push web
heroku container:release web
```

## Iterations

- [Iteration 0](https://github.com/the-raj/CSCE606_CodeJudge/blob/master/documentation/Spring2022/i0.tar)
