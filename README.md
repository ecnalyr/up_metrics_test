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

# Summary

The task that was given:


### Story:

You’re a sports and activities junkie! You belong to two or more teams, which belong to an organization. Each of these teams has 2 or more members. You want to build a profile page to show people which teams you’re a part of, which sports you love, and how much time you spend doing them. You also want to see a list of people who are on your teams, and the organization wants to see how much time is spent on these activities for each of it’s teams. 


### Details: 

- Build an app that displays information about your user. The concept is to have it serve 3 audiences: the public, the organization admin, and the user. 

- Create different views, but login is not necessary. 
  Example (use any urls/routes you like): 
                  /my/profile => user-facing 
                  /users/124 => public-facing user detail
                  /organization/summary => organization view


- Backend should be Ruby on Rails
- Front-end your choice, but should include some manner of javascript interactivity using jQuery, Angular, Backbone, React, etc.
- Can be a SPA, and no login is necessary, but a minimum of 2 views should be shown
- Data: can use localhost mysql or mysqlLite, postgres or even a file of json data. Can provide seed data if you like.
- Design is up to you, but should have a header, body and footer sections

- First view: user-facing
  
  - shows a list of sports the user is interested in - list items should have an icon and the name of the sport
  
  - shows a list of teams/groups the user is part of and the members of each
  
  - shows profile information about the user - first & last name, email, height, weight
  
  - provides forms where the user can enter and edit profile information, and select one or more sports they’re interested in
  
  - User can also select whether their profile information is public or private
  
  - User can also input sport participation data - a date, a sport, and the duration of participation

- Second view: consumer-facing
  
  - shows a line or bar chart detailing the user’s sport participation over the past week
  
  - shows the user’s profile information if it has been marked public
  
  - Extra credit: we can filter the chart by sport, and aggregate by day, week, or month

- Third view: organization-facing
  
  - Shows a list of teams in the organization
  
  - Shows a chart of participation data by team
  
  - Extra credit: we can filter the chart by user


