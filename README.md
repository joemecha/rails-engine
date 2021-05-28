![Title image](lib/images/title_rails_engine.jpeg)

[![Build Status](https://travis-ci.com/joemecha/rails-engine.svg?branch=main)](https://travis-ci.com/joemecha/rails-engine)
## Table of contents
[**General Info**](#general-info) |
[**Link**](#link) |
[**Database Schema**](#database-schema) |
[**Areas of Focus**](#areas-of-focus) |
[**Technologies**](#technologies) |
[**Setup**](#setup) |
[**Features**](#features) |
[**Status**](#status) | 
[**Contact**](contact)


## General info
RAILS ENGINE -- As a devloper working for a FICTITIOUS company developing an E-Commerce Application, my team is working in a service-oriented architecture (the front and back ends of this application are separate and communicate via APIs). 

This project is a build of a Rails API to expose the data that powers the site, which the front end would then consume.

### Features:
  * Business Intelligence (ActiveRecord Queries)
     * find a quantity of merchants sorted by descending revenue
     * find a quantity of items sorted by descending revenue

     * find a quantity of merchants sorted by descending item quantity sold
     * revenue report, broken down by month in ascending date order


     * total revenue generated in the whole system over a start/end date range   X
     * total revenue for a given merchant                                        X
     
     * total revenue of successful invoices which have not yet been shipped
  

## Link
### [https://joe-rails-engine.herokuapp.com/](https://joe-rails-engine.herokuapp.com/)

## Database Schema
![Diagram](lib/images/database_diagram.png "Database Schema")

## Areas of Focus
* Expose an API
* Use serializers to format JSON responses
* Test API exposure
* Compose advanced ActiveRecord queries to analyze information stored in SQL databases 
* Write basic SQL statements without the assistance of an ORM
* Reading documentation / individual research
* Breaking down large project / problems into small pieces

## Technologies
Project is created with:
* Ruby version 2.5.3
* Rails version 5.2.5
* PostgreSQL
* RSpec
* Capybara
* Factorybot
* Faker
* RuboCop
* SimpleCov
* Travis CI
* Heroku

## Setup
To run this program:

Open the browser of your choice and navigate to:
[https://joe-rails-engine.herokuapp.com/](https://joe-rails-engine.herokuapp.com/)

   ## Local Setup

   1. Fork and Clone the repo
   2. Install gem packages: `bundle install`
   3. Setup the database: `rails db:create`

## To-do list:
* FULLY test API endpoints for happy/sad paths and edge cases (on-going)
* Expose the RESTful API endpoints for:
  * Merchants:
    - get all merchants, a maximum of 20 at a time
    - get one merchant
    - get all items for a given merchant ID
  * Items:
    - get all items, a maximum of 20 at a time
    - get one item
    - create an item
    - edit an item
    - delete an item
    - get the merchant data for a given item ID
* Expose non-RESTful API endpoints for:
  * ONE of following endpoint pairs:
    * find one MERCHANT based on search criteria AND find all ITEMS based on search criteria
    * find one ITEM based on search criteria AND find all MERCHANTS based on search criteria
* Expose FOUR of the following for a total of 15 endpoints:
  * find a quantity of merchants sorted by descending revenue
  * find a quantity of merchants sorted by descending item quantity sold
  * total revenue generated in the whole system over a start/end date range
  * total revenue for a given merchant
  * find a quantity of items sorted by descending revenue
  * total revenue of successful invoices which have not yet been shipped
  * revenue report, broken down by month in ascending date order

## Status
Project is: _in progress_

## Contact
Created by
Joe Mecha [GitHub](https://github.com/joemecha) • [LinkedIn](https://www.linkedin.com/in/joemecha/)

~ feel free to contact me ~

![Screenshot](lib/images/screenshot.jpeg)