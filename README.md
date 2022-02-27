# flutter_todo_app

## 　これは何？

位置情報を入力できる予定管理アプリです。

## 使用技術

- 状態管理:
  - RiverPod+StateNotifier+Freezed
- 永続化:
  - Hive
- 地図表示
  - GoogleMap

## Demo

![demo](https://user-images.githubusercontent.com/67234960/155866646-d0575e03-d884-4287-b551-cf7936b92552.gif)

## 注意点

- 現在 iOS でのみ動作確認済みです。
- 位置情報入力に GoogleMap を使用しているため、自前の APIKey が必要です。
  1. ブロジェクト直下に.env を作成
  2. .env 内に下記のように入力。({GoogleMapKey}の部分は自前の APIKey)  
     `MAP_API_KEY={GoogleMapKey}`
