## EC site for cake company

## auther
- hibik17

## UI・UXdesign
https://www.figma.com/file/f4PVEoECcZrva1uDW505tr/ECsite-UIUX?node-id=0%3A1

## Description

総合ECサイト

## launguage

- Ruby on rails (5.2.6)
- HTML&CSS
- Javascript

## Usage

- 会員側実装機能
  - 顧客は会員登録、ログイン・ログアウト、退会ができる
  - 会員のログインはメールアドレスとパスワードで行う
  - 商品の検索を行うことができる
  - サイトの閲覧はログインなしで行える
  - 商品をカートに入れ、1 度に複数種類、複数商品の購入ができること。また、カート内の商品は個数変更・削除ができる
  - カートへの商品追加はログインなしでは行えない
  - 会員はマイページからユーザ情報の閲覧・編集、注文履歴の閲覧、配送先の閲覧・編集ができる
  - 複数の配送先を指定することができる
- 店側実装機能
  - 管理者用メールアドレスとパスワードでログインできる
  - 商品の新規追加、編集、販売停止（売切表示）が行える
  - 会員登録されているユーザ情報の閲覧、編集、退会処理が行える
  - ユーザの注文履歴が一覧・詳細表示できる
  - 注文履歴には注文ごとに下記の情報が表示される
  - 商品の状態が自動で切り替わるように設定している

## Gem

- refile
- refile-mini-magick
- bootstrap
- jquery
- kaminari
- device
- paranoia
- enum_help
