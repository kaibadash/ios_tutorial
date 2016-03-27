# iOSアプリのハマりどころ、UIKitの紹介
## [@kaiba](https://twitter.com/kaiba)

# おしながき
- UIKit紹介など
- 作ってみよう1 へぇボタン
- 作ってみよう2 TODOアプリ

# iOSでできることはたくさんあるけど今日はUIKit
- リッチなフロントエンド部品を提供
- ウェブアプリだとHTMLとJSでやるとこ
- AppleのSDKは*Kitの名前がついてるのが多い
- MVC

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/uikit.PNG?raw=true)

# ちなみにiOSでできること
- iOSはFreeBSDベース
- C言語も書ける。低レベルなこともできる。
- UnixのOSSが活かせる可能性がある(ex: OpenCV, ZBar)
- 可能性は無限大。夢がひろがりんぐ。

# 1ページでわかった気になるSwift
- スクリプト言語っぽいけど、コンパイルされる静的言語です。
  - コンパイラが色々教えてくれる
- `let` は定数
- `var` は定数
- `?` がついてる型はnil許容型
  - `nil` でないことを承知の上で `!` をつけてアクセスするか
  - `user?.name` のように `nil` の場合無視するようにするか

# 基本的な部品
- UIView
- UILabel
- UIButton
- UITextField
- UISwitch
- UISlider
- etc...

# UIViewController
- 1画面を管理する

# UINavigationController
- 複数のUIViewControllerを積み上げる形で管理する
- push/popで画面遷移

# UITabBarController
- 複数のUIViewControllerをtab barに紐づく形で管理する

# UITableView / UICollectionView
- 10000行あってもViewは表示する分だけしか作られずスムーズに表示でき省メモリ
- 標準で何種類かUITableViewCellがある

# StoryboardとInterfaceBuilder(IB)
- GUIで画面を作成できる
- [個人的にはStoryboardは嫌い](http://pokosho.com/b/archives/1826)。
  - チームでやるならIB!
- 全部コードで書くこともできる

# AutoLayout
- 様々な画面サイズに対応する仕組み
- 部品を広げたり、隙間を広げたり
- 隣の部品と相対的に位置やサイズを決めるのが特徴的
- こわくないよ

# iOSハマりどころ1
- iOSはユーザフレンドリーなのに、開発者には不親切
  - Developer登録時、日本語で入力するとエラーで進めず、メールを送ることになる
  - 巨大な企業なのにびっくりするくらいアナログ(メール、電話大好き)
  - そしてGmailだとAppleからのメールがスパム扱いされたり
  - リファクタリングのメニューはでるのにSwiftだとできない
  - CodeSign…うっ…頭が…
  - 急に低レベルになることがある
    - OSSは積極的かつ慎重に使っていくべき
  - 気軽にバイナリを動かせない
  - Storeリリース時、プライマリ言語は英語にしよう

# iOSハマりどころ2
- 聖書ヒューマンインタフェースガイドラインに背くとリジェクト
  - アイコンを異なる意味に使う、とか。
  - そしてリジェクトの理由を教えてくれないことも多い
  - エッチなのはいけないと思います
- クラッシュログはそのままだとバイナリデータで何もわからない
  - デバッグシンボル情報(DSYM)が必要になる
- 実機でしか起こらない問題がまれによくある

# 参考になるサイト
- [(必読!)ヒューマンインタフェースガイドライン](
https://developer.apple.com/jp/documentation/UserExperience/Conceptual/MobileHIG/)
- [公式の日本語ドキュメント](https://developer.apple.com/jp/documentation/)
- [公式のリファレンス](https://developer.apple.com/library/ios)
- [API Diffs](https://developer.apple.com/library/ios/releasenotes/General/iOS93APIDiffs/)
- [はてな教科書(最近更新された！)](https://github.com/hatena/Hatena-Textbook)
- [堤さんの最近のホッテントリに初心者向けの内容あり](http://d.hatena.ne.jp/shu223/20160320/1458434042)
- [cocoapods ライブラリ管理](https://cocoapods.org/)
- [cocoacontrols UIライブラリが探せる](https://www.cocoacontrols.com/)
- [fabric TwitterがCrashlyticsを買収した。クラッシュログ分析、アプリ配布、分析。](https://get.fabric.io/)
- [fastlane 自動化を考える際に](https://github.com/fastlane/fastlane)
