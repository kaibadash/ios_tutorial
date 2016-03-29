# 作ってみよう1.5 画面遷移
Storyboardが難しかったため、補足。

# 新規プロジェクトからsingle view projectを作る
`shift + cmd + n`

# Storyboardに画面を配置
- StoryboardからUIViewControllerを全部消す
- UITabBarControllerを置き、`Is initial view controller`をチェック。最初の画面に設定する。
- UIViewControllerを置き、viewに適当に色を付ける
- UIViewControllerをもう一つ置き、viewに適当に色を付ける

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/storyboard_tab1.png?raw=true)

# UITabBarControllerからの画面遷移を設定
- UITabBarControllerの黄色いアイコンを`ctrl`を押しながらドラッグし、UIViewControllerにドロップ
- `Relationship Segue`を選択
- もう一方も同様に。

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/storyboard_tab2.png?raw=true)

- 起動してタブの切替(画面遷移)を確認する

# チャレンジ
- 3つ目のタブに、UIViewControllerではなく、UINavigationControllerを置いてみよう！

# まとめ
- Storyboardでの画面遷移を覚えた
- ソースコードは書かなかった

# 補足
- 画面遷移時にデータを渡したい場合などは、ソースコードで画面遷移を行う必要があります。
- 一部はstoryboardで、もう片方はソースコードでの実装になりコードが追いづらい
- そもそも画面遷移はMVCではコントローラの仕事。
- Storyboardの仕事はViewに努めてほしい。
- それInterfaceBuilder?

# 次章
[作ってみよう2 TODO管理アプリ](ios_tuto3_todo.md)
