
# Task-Project

## setting

Rails: 5.2.3

Ruby: 2.5.7

DB: postgresql

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

table task_tags

|column | type|
|---|---|
|task_id | integer|
|tag_id | integer|

table tags

|column | type|
|---|---|
|name | string|
|created_at| datetime|
|updated_at| datetime|
