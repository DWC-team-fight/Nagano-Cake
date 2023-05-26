# Nagano Cakeについて

<p align="center">
  <img src="https://github.com/DWC-team-fight/Nagano-Cake/assets/127069516/0709cffe-6f1c-42fe-9396-727e089cbd12" />
</p>

## 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発アプリケーションです。

※実際のECサイトではございません。

## メンバー
- かとぅー
- たけ
- ちーちゃん
- てるてる
##  使用している言語とフレームワークとGemのバージョン

- Ruby 3.1.2
- Ruby on Rails 6.1.7.3
- bootstrap 4.5
- devise
- kaminari 1.2.1
- Font Awesome
- active strage
- enum
- pry rails


## 機能
-   顧客側
    
    -   アカウント
        -   新規会員登録
        -   ログイン
        -   ログアウト
        -   退会（アカウントの論理削除）
        -   会員情報の編集
        -   配達先住所の登録、編集、削除
    -   商品
        -   商品をカートに入れる
        -   カート内商品の選択削除、全削除
        -   カート内商品の購入
        -   配達先住所の選択
        -   注文履歴の閲覧
        
-   管理者側
    
    -   登録ユーザーの一覧表示
    -   登録ユーザーの注文履歴閲覧
    -   商品の新規追加、編集、閲覧
    -   商品情報の編集
   
-  設計書
  
    -   [ER図](https://drive.google.com/file/d/1inr7LSExuMxiJcy5JPlysd6j5okldqcA/view)
    -   [テーブル定義書](https://docs.google.com/spreadsheets/d/1D6z-31bGuOa9CKtwaWqsg9KXOQQuc4lle4EK3cVPsKk/edit#gid=1373217982)
    -   [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1D6z-31bGuOa9CKtwaWqsg9KXOQQuc4lle4EK3cVPsKk/edit#gid=1373217982)
   
   
-   その他
    
    -   エラーメッセージの日本語化
