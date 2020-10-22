# Kilologram
体重を記録するWebサービスです。

##  App URL
https://kilologram-00.herokuapp.com/

## Description
日々の体重を入力して、カレンダーに表示することができます。

## テーブル設計

## users テーブル

| Column            | Type    | Options       |
|-----------------  |-------- |-------------  |
| name              | string  | null: false   |
| email             | string  | null: false   |
| password          | string  | null: false   |

### Association

- has_many :calendars


## calendars テーブル

| Column                  | Type        | Options                         |
|-----------------------  |------------ |-------------------------------- |
| weight                  | string      | null: false                     |
| start_time              | datetime    | null: false                     |
| content                 | text        | null: false                     |
| user                    | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user

## Install

$ git clone https://github.com/naka4a3o/kilologram.git
$ cd kilologram
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
 http://localhost:3000

