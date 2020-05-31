Smoodies
========================

Cristian Cedacero & Franchell Polanco Welcome you to our Command Line Application, Smoodie, that suggests smoothie recipes based on a user's chosen mood.

## Basics

Smoodie is a Command Line CRUD App that uses a database to persist information. Some of the concepts practiced on this project include:

- Ruby
- Object Orientation
- Relationships (via ActiveRecord)
- Problem Solving (via creating a Command Line Interface (CLI))
- Using third party Gems (Faker, tty-prompt)

Our Smoodie app is made up of the following:

1. Contain five models with corresponding tables, including two joiner tables.
2. We use Sqlite3 alongisde ActiveRecord  and faker to persist the data and manage seeding.
3. Users are able to interact through the CLI:
  a. Users are able to register for accounts   
  b. Users are able to login to existing accounts   
  c. Users are able to get smoothie recipe   recommendations based on their mood  
  d. Users are able to favorite their smoothie recommendations.  
  e. Users are able to delete their smoothies  
4. We use separate models for our runner and CLI interface.  

A video walkthrough of the app can be seen here:  
https://www.youtube.com/watch?v=_R2iBBBZD7A

## Installation
clone this repository  
run bundle install to install the necessary gems  
run ruby bin/run.db to start!  
