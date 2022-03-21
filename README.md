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

### Useful commands

```sh
git subtree push --prefix codejudge heroku master
```

Installing pg gem locally on mac with libpg installed by homebrew

```sh
gem install pg -v '0.21' -- --with-pg-config=/usr/local/Cellar/libpq/14.2/bin/pg_config
```

To push to heroku

```sh
heroku container:push web
heroku container:release web
```

## Iterations

- [Iteration 0](https://github.com/the-raj/CSCE606_CodeJudge/blob/master/documentation/Spring2022/i0.tar)
