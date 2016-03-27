# iOSアプリのハマりどころ、UIKitの紹介
## @kaiba

# おしながき
- UIKit紹介など
- 作ってみよう1 へぇボタン
- 作ってみよう2 TODOアプリ

# iOSでできることはたくさんあるけど今日はUIKit
- リッチなフロントエンド部品を提供
- ウェブアプリだとHTMLとJSでやるとこ
- AppleのSDKは*Kitの名前がついてるのが多い
- Model View Controller

TODO:写真

# ちなみにiOSでできること
- iOSはFreeBSDベース
- C言語も書ける。低レベルなこともできる。
- UnixのOSSが活かせる可能性がある(ex: OpenCV, ZBar)
- 可能性は無限大。夢がひろがりんぐ。

# 1ページでわかった気になるSwift
スクリプト言語っぽいけど、コンパイルされる静的言語です。
```swift
class Animal {
  private let hello: String = "Hello" // 定数
  var name: String = "hoge" // 変数

  func hello(animal: Animal?) -> void {
    return animal?.name + "," + hello
    // こう書いても良いが短いほうが良いよね
    if animal != null {
      return animal!.name + "," + hello
    }
  }
}
```

# ボタンとかの部品

# UIViewController

# UINavigationController

# UITabBarController

# 画面部品まとめ

# UITableView / UICollectionView
- 省メモリ
- 10000行あってもViewは表示する分だけしか作られずスムーズに表示できる
- 標準で何種類かUITableViewCellがある

# StoryboardとInterfaceBuilder(IB)
- GUIで画面を作成できる
- [個人的にはStoryboardは嫌い](http://pokosho.com/b/archives/1826)。
  - チームでやるならIB!

# AutoLayout
- 様々な画面サイズに対応する仕組み
- 部品を広げたり、隙間を広げたり
- 隣の部品と相対的に位置やサイズを決めるのが特徴的
- こわくないよ

# iOSハマりどころ1
- iOSはユーザフレンドリーなのに、開発者には不親切
  - Developer登録のためのアカウントを日本語で入力するとエラーで進めず、メールを送ることになる
  - 巨大な企業なのにびっくりするくらいアナログ(メール、電話大好き)
  - そしてGmailだとAppleからのメールがスパム扱いされたり
  - リファクタリングのメニューはでるのにSwiftだとできない
  - CodeSign…うっ…頭が…
  - 急に低レベルになることがある
    - OSSは積極的かつ慎重に使っていくべき
  - 気軽にバイナリを動かせない
    - AppStoreに出したバイナリがテスト環境を向いていないか不安になってきた…
  - デフォルト言語を後から変更できない

# iOSハマりどころ2
- 聖書ヒューマンインタフェースガイドラインに背くとリジェクト
  - アイコンを異なる意味に使う、とか。
  - そしてリジェクトの理由を教えてくれないことも多い
  - エッチなのはいけないと思います
- クラッシュログはそのままだとバイナリデータで何もわからない
  - デバッグシンボル情報(DSYM)が必要になる
- 実機でしか起こらない問題がまれによくある

# 参考になるサイト
(必読!)ヒューマンインタフェースガイドライン
https://developer.apple.com/jp/documentation/UserExperience/Conceptual/MobileHIG/
公式の日本語ドキュメント
https://developer.apple.com/jp/documentation/
公式のリファレンス
https://developer.apple.com/library/ios
API Diffs
https://developer.apple.com/library/ios/releasenotes/General/iOS93APIDiffs/index.html
はてな教科書(最近更新された！)
https://github.com/hatena/Hatena-Textbook
堤さんの最近のホッテントリに初心者向けの内容あり
http://d.hatena.ne.jp/shu223/20160320/1458434042
cocoapods ライブラリ管理
https://cocoapods.org/
cocoacontrols UIライブラリが探せる
https://www.cocoacontrols.com/
fabric TwitterがCrashlyticsを買収した。クラッシュログ分析、アプリ配布、分析。
https://get.fabric.io/
fastlane 自動化を考える際に。
https://github.com/fastlane/fastlane
