# README
### Dependencies
Ich habe Cloudinary zur Bildspeicherung verwendet, deswegen wird eine API Umgebungsvariable benötigt!\
Dazu eine .env Datei im Projektordner erstellen und die Umgebungsvariable hinzufügen.
```
touch .env
```
```
# .env
CLOUDINARY_URL=cloudinary://298522699261255:Qa1ZfO4syfbOC-***********************8
```

Die Cloudinary API Umgebungsvariable gegebenfalls bei mir anfragen.

## Rezeptbuch (WIP)
#### Was koche ich heute?

![image](https://user-images.githubusercontent.com/2192560/212006244-ea47a9e8-4a85-4077-aaf9-c2552edca872.png)

## Forstshritt
Recipe Model\
Recipe CRUD\
Layout und Design (WIP)

### Datenbank Schema
Geplantes Schema\
![Final_schema](https://user-images.githubusercontent.com/2192560/211815520-bd85366e-aeb0-42e0-8e54-b00541321e9d.PNG)

DB Schema mit Active Storage (für Cloudinary)
![Final_schema_Cloudinary](https://user-images.githubusercontent.com/2192560/211815420-fee715b8-e11a-470c-913e-aba9bc570298.PNG)

* System dependencies:\
  Yarn package manager (or NPM - I used Yarn)\
  Bundler

* Database creation:\
  Run `bin/rails db:create`\
  Run `bin/rails db:migrate`

* Database initialization:\
  Run `bin/rails db:seed`

* How to run the test suite:\
  Run `bin/rails test:all`
  
## Getting Started

To get a local copy up and running follow these steps.

- Change to the desired directory then run the following:

  - Git clone the project
  - cd rezeptbuch/
  - run `npm install` or `yarn install`
  - run `bundle install`
  - run `bin/rails assets:precompile`
  - run `bin/rails db:create`
  - run `bin/rails db:migrate`
  - run `bin/rails db:seed`

## Running the Application Locally

 \_Steps to execute the app locally_

> Run `bin/rails server` in the console in the working directory

## Running tests

 \_Steps to execute the app's test suite locally_

> Run `bin/rails test:all`

## Versionen

* Ruby Version\
3.1.2

* Rails Version\
7.0.4

* Databenbank
SQLite3
