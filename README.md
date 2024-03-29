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
[MVP ausprobieren](https://rezeptbuch.fly.dev/)

![Layout_w_Login](https://user-images.githubusercontent.com/2192560/212553288-c2d66c79-2e71-46be-96e0-21847eebb792.PNG)

## Fortshritt
Recipe Model\
Recipe CRUD\
Layout und Design\
User Model\
A User has 1:N Recipes\
Boostratp to make it responsive\
Login and simple user authentification\
Public API

Bemerkung: Diese app benutzt esbuild anstatt Importmaps


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

## Public API
Anyone can fetch recipe data.
#### JSON Response
Get all recipes\
[rezeptbuch.fly.dev/api/v1/recipes](https://rezeptbuch.fly.dev/api/v1/recipes)

For a specific recipe, include the recipe ID\
[rezeptbuch.fly.dev/api/v1/recipes/:id](https://rezeptbuch.fly.dev/api/v1/recipes/:id)\
eg, [rezeptbuch.fly.dev/api/v1/recipes/8](https://rezeptbuch.fly.dev/api/v1/recipes/8)

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
3.3.0

* Rails Version\
7.1.3

* Databenbank\
LiteStack litedb (SQLite3)
