# README

## Project Description
This is a ruby on rails project for Rocket Elevators. Different data models and databases are created to store the information of the company.

#### Back Office Instructional Video
This video gives a brief explanation of the process for submitting a contact form to the Home Page, connecting to a second database, export and import data from mySQL database to postgreSQL database <br />
Link: <em>https://youtu.be/hoXt9AfBXJY</em>

### Back Office Admin Logins
Nicolas Genest | CEO | nicolas.genest@codeboxx.biz | password: password

Nadya Fortier | Director | nadya.fortier@codeboxx.biz | password: password

Martin Chantal | Director Assistant | martin.chantal@codeboxx.biz | password: password

Mathieu Houde | Captain | mathieu.houde@codeboxx.biz | password: password

Abdul Akeeb | Developer | abdul.akeeb@codeboxx.biz | password: password

Timothy Wever | Developer | timothy.wever@codeboxx.biz | password: password

Krista Sheely | Developer | krista.sheely@codeboxx.biz | password: password 

### Instructions

First, you need a copy a a database.yml file, which will specify your database information. Add this file to the config folder. A copy of the database.yml file is here https://github.com/dominhannguyen/database-yml

Second, open your ubuntu terminal and run this command to install the dependencies:

```bundle install```

Third, run this command to set up your databases:

```rails db:setup```

Finally, run this command:

```rails server ```

You can now see the website at a web browser at localhost:3000

### Ruby / Rails version
We used Ruby 2.6.6 and Ruby on Rails 5.2.6

### Gem used:

- Secondbase to connect to the second database: https://rubygems.org/gems/secondbase
- Rails Admin for the admin panel
- Devise for user authentication
- PG for Postgres database

### Collaborators
Team Lead: <strong>Do Minh An Nguyen</strong> (Domin)<br />
Team Members: <strong>Jacob Gomez</strong>, <strong>Matthew Dandurand</strong>, <strong>Arman Adibi</strong>, and <strong>Tyler Calderon</strong>
