
# Task-Project

## env

Rails: 6.0.3

Ruby: 2.7.1

DB: postgresql

## setup setting

### set up .env and database file

```shell
cp .env.example .env
cp config/database.example.yml config/database.yml
```

### run database via docker-compose

```shell
docker-compose up
```

## Table Schema

table users

|column | type|
|---|---|
|email | string|
|name | string|
|password | string|
|created_at| datetime|
|updated_at| datetime|

table tasks

|column | type|
|--|--|
|title | string|
|content | text|
|state | integer|
|priority | integer|
|end_time | date|
|user_id | integer|
|created_at| datetime|
|updated_at| datetime|

table taggings

|column | type|
|---|---|
|task_id | integer|
|tag_id | integer|
|created_at| datetime|
|updated_at| datetime|


table tags

|column | type|
|---|---|
|name | string|
|created_at| datetime|
|updated_at| datetime|
