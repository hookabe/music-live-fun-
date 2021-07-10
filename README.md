# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | string | null: false               |

### Association

- has_many :liveroom_users
- has_many :liverooms, through: :liveroom_users
- has_many :messages
- has_many :setroom_users
- has_many :setrooms, through: :setroom_users
- has_many :setlists
- has_many :pictures
- has_many :comments

## LiveroomUser テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| liveroom | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :liveroom

## Liverooms テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| date          | date       | null: false                    |
| prefecture_id | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| livehouse_id  | integer    | null: false                    |
| livetitle     | string     | null: false                    |

### Association

- has_many :liveroom_users, dependent: :destroy
- has_many :users, through: :liveroom_users
- has_many :messages, dependent: :destroy

## Messages テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :liveroom
- belongs_to :user

## SetroomUser テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| setroom | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :setroom

## Setrooms テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| date          | date       | null: false                    |
| prefecture_id | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| livehouse_id  | integer    | null: false                    |
| livetitle     | string     | null: false                    |

### Association

- has_many :setroom_users, dependent: :destroy
- has_many :users, through: :setroom_users
- has_many :setlists, dependent: :destroy

## Setlists テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :setroom
- belongs_to :user

## Pictures テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## Comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| picture | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :picture