# 作ってみよう1 へぇボタン

トリビアアプリ(笑)を一緒に作りましょう。
アプリの説明は要りませんね。
![](https://github.com/kaibadash/ios_tutorial/blob/master/img/hee.png?raw=true)

[ソースコード](https://github.com/kaibadash/ios_tutorial/tree/master/Trivia)もありますので、迷ったら見てみてください。

# 新規プロジェクトからsingle view projectを作る
`shift + cmd + n`

# Storyboardに部品を置く
![](https://github.com/kaibadash/ios_tutorial/blob/master/img/add_button.png?raw=true)
- UIButton
  - へぇボタン
- UILabel
  - へぇカウント

# AutoLayoutを設定する
- 位置を調整
- サイズやマージンを調整
- 適当にデザインしてみよう
- 下のようにAutoLayoutと見た目が異なる警告が表示されたらUpdate Frames
  - `alt + cmd + =`

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/autolayout.png?raw=true)

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/autolayout_update.png?raw=true)


# ソースコードと紐付ける準備
- `@IBOutlet`はUI部品と紐付ける
- `@IBAction`はアクションだけを紐付ける

```Swift
@IBOutlet var label: UILabel!
@IBAction func heeAction() {
    // 後で書く
}
```

# ソースコードと紐付ける
- 紐付けたい部品を選択して
- →アイコンを選択
- ソースコードで定義した名前が見えるので、`◯`をD&D
- ボタンのイベントは通常 `Touch up inside`

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/binding_ib.png?raw=true)

# アクションを書く

```swift
private var heeCount: Int = 0

@IBAction func heeAction() {
    heeCount += 1
    label.text = "\(heeCount)へぇ"
}
```

動作させてみましょう！

# まとめ 学んだこと
- Storyboard/InterfaceBuilder
- AutoLayout
- ソースコードとStoryboardとひも付け
- 基本はOK! あとは先ほど挙げたサイトなどを見て独り立ちできるはず!

# 宿題

## へぇ〜ボタンの画像を設定したいですよね

## 音を鳴らしたいですよね？
- フリー音素材作っておきました^^
  - [へぇ〜](https://github.com/kaibadash/ios_tutorial/blob/master/img/hee.wav)
  - [はぁ?](https://github.com/kaibadash/ios_tutorial/blob/master/img/haa.wav)
- AVFoundationという別の部品を使うと思いますが、怖くないよ。

# 次章
[作ってみよう1.5 画面遷移](ios_tuto1.5_storyboard.md)
