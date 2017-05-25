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

## Completed Work

### Core

I did not complete the assignment 100%, but I feel like the back-end is ready to serve the front-end pending small adjustments (like adjustments to permitted parameters and other little things).  I am not an expert with Angular, so I was not able to complete all of the requested work in the available time.

The only features that have full front and back end functionality have to do with User CRUD, and I only handle the C and R of CRUD.  You can see an integration test [here](https://github.com/ecnalyr/up_metrics_test/blob/master/spec/features/users_spec.rb).

> Backend should be Ruby on Rails

It is.

> Front-end your choice, but should include some manner of javascript interactivity using jQuery, Angular, Backbone, React, etc.

I used an Angular app that is inside of the `client` directory.

> Can be a SPA, and no login is necessary, but a minimum of 2 views should be shown

The front-end is very sparse at this moment, the focus of my work was on the back-end.

The app can been seen at http://localhost:4200/, and you can navigate to a few different pages.  You can click on user names, for example, which take you to: http://localhost:4200/user-detail/1

> Data: can use localhost mysql or mysqlLite, postgres or even a file of json data. Can provide seed data if you like.

Used PostgreSQL.  There is a db seed, but it doesn't have much. (the rspec test suite has some example data available).

> Design is up to you, but should have a header, body and footer sections

I barely worked on the front-end, there isn't much to see.

### First View: user-facing

Since I don't have any finalized UI, I'll detail the API endpoints that would support these features if the front-end UI was written.

I wrote some rspec tests to help explain these endpoints as they related to the requested tasks, they are in the [`spec/requests/user_facing` directory](https://github.com/ecnalyr/up_metrics_test/tree/master/spec/requests/user_facing).

> shows a list of sports the user is interested in - list items should have an icon and the name of the sport

Request spec: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/user_facing/user_sport_interests_spec.rb

The icon would be referenced via a url (or a unicode icon?) stored at icon_url.

> shows a list of teams/groups the user is part of and the members of each

Request spec: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/user_facing/user_viewing_associated_teams_spec.rb

A list of team members (`Users`) is included with each `Team` object.

> shows profile information about the user - first & last name, email, height, weight

Request spec: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/user_facing/user_profile_spec.rb

Private or not, details are not filtered here because this view is intended for the user.

> provides forms where the user can enter and edit profile information, and select one or more sports they’re interested in

I didn't complete the UI for these, so there isn't much to see.  The controllers exist ([user with profile information](https://github.com/ecnalyr/up_metrics_test/blob/master/spec/controllers/users_controller_spec.rb), [sports interests](https://github.com/ecnalyr/up_metrics_test/blob/master/spec/controllers/sports_interests_controller_spec.rb)), but may need a bit of touch up.

> User can also select whether their profile information is public or private

When user profile data is requested. . .

- The 'user' will always see data from the [UserSerializer](https://github.com/ecnalyr/up_metrics_test/blob/master/app/serializers/user_serializer.rb).

- The 'consumer' will see data from the [PrivateUserSerializer](https://github.com/ecnalyr/up_metrics_test/blob/master/app/serializers/private_user_serializer.rb) if the user's profile is private.

> User can also input sport participation data - a date, a sport, and the duration of participation

Request spec showing the ability to view participation data: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/user_facing/user_participation_spec.rb

Did not build the form for this, but the controllers exist and may need a bit of work to make them work with the hypothetical form ([Participation](https://github.com/ecnalyr/up_metrics_test/blob/master/spec/controllers/participations_controller_spec.rb), if a new Sport needed to be created, the [SportsController](https://github.com/ecnalyr/up_metrics_test/blob/master/spec/controllers/sports_controller_spec.rb) exists).

### Second View: consumer-facing

Similar to above, I haven't completed the UI, so I'll provide as much detail as reasonable on how I would get the necessary data from the API.

These requests specs live in the [`spec/requests/consumer_facing` directory](https://github.com/ecnalyr/up_metrics_test/tree/master/spec/requests/consumer_facing).

> shows a line or bar chart detailing the user’s sport participation over the past week

Request spec: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/consumer_facing/user_participation_spec.rb

Each [`participation`](https://github.com/ecnalyr/up_metrics_test/blob/master/app/models/participation.rb) for the user, [scoped by participation during the last week](https://github.com/ecnalyr/up_metrics_test/blob/master/app/models/participation.rb#L11), is provided with the `date`, `duration_minutes`, and name of the sport.

> shows the user’s profile information if it has been marked public

Request spec: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/consumer_facing/user_profile_spec.rb

As mentioned above, if the profile is marked as private, [a different serializer is used](https://github.com/ecnalyr/up_metrics_test/blob/master/app/controllers/users_controller.rb#L13) to restrict the information provided by the endpoint.

> Extra credit: we can filter the chart by sport, and aggregate by day, week, or month

I didn't write any of the UI for this.

I would probably add scope parameters to the API rather than making the front-end do all of the filtering work on its own.

### Third View: organization-facing

Same as both sections above, the UI does not exist.  Details about grabbing appropriate information from the API will be presented below.

Request specs for these features will be in the [`spec/requests/organization_facing` directory](https://github.com/ecnalyr/up_metrics_test/tree/master/spec/requests/organization_facing)

> Shows a list of teams in the organization

Request spec: https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/organization_facing/teams_spec.rb

> Shows a chart of participation data by team

Request spec (same as the previous one): https://github.com/ecnalyr/up_metrics_test/blob/master/spec/requests/organization_facing/teams_spec.rb

Each team object given by the `/api/organizations/#{@organization1.id}/teams` endpoint includes [team participation_summary data](https://github.com/ecnalyr/up_metrics_test/blob/master/spec/models/team_spec.rb#L13-L33).

> Extra credit: we can filter the chart by user

Not complete.
