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

### Accounts and post access

Visitors can read posts without an account. Create an account at `/sign_up` or sign in at `/sign_in` to publish posts. Users can edit or delete only posts they created.

Existing posts remain publicly readable after migration. Since they have no recorded author, assign them to the intended user before editing them (for example, in the Rails console, set each post's `user` association).

* How to run the test suite:

```bash
bin/rails test
```

* How to run the project:

```bash
bin/dev
```