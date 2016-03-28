# 作ってみよう1.5 画面遷移
Storyboardが難しかったため、補足。

# 新規プロジェクトからsingle view projectを作る
`shift + cmd + n`

# Storyboardに画面を配置
- StoryboardからUIViewControllerを全部消す
- UITabBarControllerを置く
- UIViewControllerを置き、viewに適当に色を付ける
- UIViewControllerをもう一つ置き、viewに適当に色を付ける

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/storyboard_tab1.png?raw=true)

# UITabBarControllerからの画面遷移を設定
- UITabBarControllerの黄色いアイコンを`ctrl`を押しながらドラッグし、UIViewControllerにドロップ
- `Relationship Segue`を選択
- もう一方も同様に

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/storyboard_tab2.png?raw=true)

- 起動してタブの切替(画面遷移)を確認する

# チャレンジ
- 3つ目のタブに、UIViewControllerではなく、UINavigationControllerを置いてみる

# 次章
[作ってみよう2 TODO管理アプリ](ios_tuto3_todo.md)
