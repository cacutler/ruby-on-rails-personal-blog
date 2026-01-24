# Personal Blog (Ruby on Rails Project)

This is a basic blog project used with Ruby on Rails and PostgreSQL for learning the Ruby language, the Rails framework, and PostgreSQL.

### Project Information

* Ruby version: 3.4.7

* Rails version: 8.1.2

* Use the following command for installing all of the project gems:

```bash
bundle install
```

* Database creation - run the following commands:

```bash
psql -U postgres
```

```sql
CREATE DATABASE blog_development;
CREATE DATABASE blog_test;
```

* Database initialization - use the following command to run database migrations:

```bash
rails db:migrate
```

* How to run the test suite:

```bash
bin/rails test
```

* How to run the project:

```bash
bin/dev
```