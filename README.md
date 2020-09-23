# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#TABLES

## users

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :routines (as owner)
- has_many :routines, through: routine_users
- has_many :histories

## routines
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| description| string     |                                |
| start_date | date       | null: false                    |
| end_date   | date       |                                |
| time       | time       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user (owner)

## routine_users

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| routine | references | null: false, foreign_key: true |
|postponed| boolean    |                                |

### Association

- belongs_to :user
- belongs_to :routine

## Histories
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| date    | date       | null: false                    |
| status  | string     | finished/ gived up/ postponed  |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| routine | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :routine