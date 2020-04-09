---
---

<p align="center">
<img alt="WASHOSH ICON" src="https://raw.githubusercontent.com/AlMuhannaMH/washosh/master/app/assets/images/icon.png">
</p>

WASHOSH is an aggregation platform, it is designed to open the communication of society in which everyone can participate, without hesitation through and creating communities and everyone can post as well as comment on topics such as news, sport as well as art and entertainment, etc.  
WASHOSH gives opinions and experiences based on subscriptions to the content of the communities. It makes it easier for you to find the best place for you to enjoy.

---

## User Stories

### As a user

- I want to register to have an account on the platform.
- I want to manage my information.
- I want to delete my account from the platform.
- I want to create a new community.
- I want to subscribe to another community that I like.
- I want to add a post in the community which I create or I subscribed to it.
- I want to add comments on all the posts on the platform.

---

## Technologies and tools used in the Project

- Ruby on Rails
- RubyGems (listed down blow)
- VS Code
- notepad++
- sublim text 3
- pgAdmin 4 (postgresql)
- Firefox Browser Developer Edition.
- Bootstrap
- jQuery
- Heroku

---

## Entity Relationship Diagram (ERD)

- accounts
- communities
- subscriptions
- posts
- comments
- votes (In progress)

<p align="center">
<img alt="WASHOSH ERD" src="https://raw.githubusercontent.com/AlMuhannaMH/washosh/master/app/assets/images/ERD-Highlight.png">
</p>

---

## Ruby version

- 2.5.7

## System dependencies

```ruby
- gem 'pg', '>= 0.18', '< 2.0'
- gem 'dotenv-rails'
- gem 'devise'
- gem 'bootstrap', '~> 4.3.1'
- gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
```

## Configuration

### - Create new file .env in your project root directory with below information to configure your PostgreSQL DB in database.yml

```text
- DATABASE_USERNAME=YOUR_DATABASE_USERNAME_HERE
- DATABASE_PASSWORD=YOUR_DATABASE_PASSWORD_HERE
- DATABASE_HOSTNAME=YOUR_DATABASE_HOSTNAME
```

## Database creation

### - Run the following command to create the DB in your pg server

- ```rails db:reset``` which does runs db:drop, db:setup

## Database initialization

### - Run the following command to migrate the DB

- ```rails db:migrate``` which does runs migrations for the current env that have not run yet

## Deployment instructions

- Please refer to **[Deployment on Rails 5](https://devcenter.heroku.com/articles/getting-started-with-rails5)** in Heroku website to see the necessity instructions step in order to deploy the application

---

## Resources

- **[Ruby on Rails](https://rubyonrails.org/)**
- **[dotenv](https://github.com/bkeepers/dotenv)**
- **[Devise](https://github.com/heartcombo/devise)**
- **[Heroku](https://www.heroku.com/)**

---
---
