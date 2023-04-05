# README

## Ruby version
ruby 3.2.0 (2022-12-25 revision a528908271) [x86_64-linux]

## Database initialization
```
rails db:migrate
```

## Instructions
- Start the server: `rails s`
- Go on `https://localhost:3000`

## Reminders
- Create a new RoR project: `rails new friends`
- Create a model named `friends` and a DB named `Friends` with the following columns: `last_name`, `first_name`, `birthdate`.
```
 rails g scaffold friends first_name:string last_name:string birthdate:date
 rails db:migrate
```
- Create a new model `Dogs`. A `dog` has one `friend`. A `friend` has zero or several `dogs`.
```
 rails g scaffold dogs name:string
 rails db:migrate
```
  - Link `friends` and `dogs`:
    - in a terminal, run:
    ```
    rails generate migration add_references_to_dogs friend: references
    rails db:migrate
    ```
    - Update the `dog` model:
    ```ruby
     class Dog < ApplicationRecord
       belongs_to :friend
     end
    ```
    - Update the `friend` model:
      ```ruby
       class Friend < ApplicationRecord
         has_many :dogs
       end
      ```
  - `dogs` CRUD under `/friends/:id/dogs`:
    - modify `routes.rb`:
    ```ruby
     resources :friends do
        resources :dogs
     end
    ```
- Create a new model `Houses`. A `friend` needs to have a `house`, and the `house` has to be created while the `friend` is created. The `Houses` model does not have its own CRUD.
```
 rails g scaffold houses type: enum["appartment","house"] city:string
 rails db:migrate
```
  - Link `houses` and `friends`:
  ```
   rails generate migration add_reference_to_houses friend: references
   rails db:migrate
  ```
  - Update the `house` model:
  ```ruby
   class House < ApplicationRecord
     belongs_to :friend
   end
  ```
  - Update the `friend` model:
  ```ruby
   class Friend < ApplicationRecord
     has_many :dogs
     has_many :houses
   end
  ```
