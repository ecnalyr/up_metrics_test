# Setup
This is a Rails app serving as an API back-end to an Angular front-end that lives in the `client` directory.

The database is PostgreSQL.

## Important versions:
- Rails 5.0.X
- Ruby 2.3
- Angular 4 (Used Angular CLI 1.0.0)

To run locally, you need to run both the Rails and Angular applications.

### Install everything

From the root of the project directory:

```
bundle install
```

From the `client` directory:

```
npm install
```

### Set up your database:


```
rails db:create
rails db:migrate
rails db:seed
```

### Start the Rails server:

```
rails s -p 3000
```

### Start the Angular app:

From the `client` directory:

```
npm start -p 4200
```

### View it in the browser:

http://localhost:4200/ will take you to the app's home page.

The Rails API is not secured, so you can view json data by visiting a url, for example: http://0.0.0.0:3000/api/sports

### Tests:

Rspec is used to test the API and integration between the Rails API and Angular.

Karma is used to test the Angular app.


From the root of the project directory:

```
rspec
```

From the `client` directory:

```
ng test
```

* Note: As of this writing, some failures are included in the angular test coverage because I'm an Angular novice.

***
