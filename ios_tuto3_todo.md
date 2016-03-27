# 作ってみよう2 TODO管理アプリ
シンプルなTODO管理アプリを作ります。

[ソースコード](https://github.com/kaibadash/ios_tutorial/tree/master/ToDo)もありますので、迷ったら見てみてください。

# 完成イメージ
- 右上のボタンからTODO追加
- リスト表示
- タップするとTODO編集、完了
- (チャレンジ)データの保存、取得

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/todo1.png?raw=true)

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/todo2.png?raw=true)

# 新規プロジェクトからsingle view projectを作る
`shift + cmd + n`

# UINavigationControllerをStoryboardに置く
- トップページを作ったUINavigationControllerをStoryboardに置くに変更する

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/nav.png?raw=true)

![](https://github.com/kaibadash/ios_tutorial/blob/master/img/initial_view.png?raw=true)

# StoryboardでUIを作る
- 右上UINavigationControllerのバー(UINavigationBar)に追加ボタン
　- `Navigation Item` を置き、その中に `Bar Button Item`を置く
- タイトルやデザインは好みに設定してみよう

# 一覧画面の作成 UITableViewControllerを使う1
- `UITableViewController`を継承する
- `UITableView`を1つ持つコントローラ

```swift
class ViewController: UITableViewController
```

- Storyboardの`TableView`の`delegate`と`data source`を`ViewController`に結びつけます。
- まだ必要なメソッドを実装していないので、動作させると落ちます。

# 一覧画面の作成 UITableViewControllerを使う2
- delegate, data sourceを実装する
  - Template Methodパターン(JavaでいうとAbstractクラス)
  - 空行でtableviewと入力すると補完が出てきます

```swift
// TODO:リストの行数を返す
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10 // TODO:仮処理を削除する
}

// TODO:1行分のView(UITableViewCell)を返す
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // 表示する分だけのセルを確保する処理です。
    // 指定したcellIDのセルがなければ新しく作り、あれば使い回します。
    let cellID: String = "cell"
    var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell?
    if cell == nil {
        cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
    }
    // TODO:仮処理を削除する
    cell!.textLabel!.text = "TODOの内容をここに記載します"
    return cell!
}
```

ここで一度動かしてみましょう。
ひとまず、ダミーのデータが表示されるはずです。

# TODOクラスを作る
シンプルにタイトルだけ。
いずれ、優先度や期限をつけても面白いかもしれませんね。
```
class ToDo {
    var title: String = ""

    init(title: String) {
        self.title = title
    }
}
```

# 新しいTODOを作ってリストで管理する
```
private var todoList: [ToDo] = [ToDo]()

@IBAction func addTodo() {
    // TRY:ここでダイアログなどで入力させると親切ですね
    todoList.append(ToDo(title:"新しいTODO\(todoList.count)"))
    tableView.reloadData()
}
```

- `addToDo`はStoryboardで右上の追加ボタンとひも付けてください。

# UITableViewの仮処理を直す
`// TODO:仮処理を削除する` の箇所を本物のデータ`todoList`を使って書き換えてみてください。

```swift
// 個数
todoList.count
```

```swift
// indexPath.rowに表示するリストの行が入っています
let todo: ToDo = todoList[indexPath.row]
cell!.textLabel!.text = todo.title
```

ここで一旦動かして、TODOが追加されるか確認しましょう。

# 編集画面を作る1
- UIViewControllerを継承した`TodoEditController.swift`を作成します
- Storyboardにも新しいUIViewControllerを追加してクラスを`TodoEditController`にします
- ソースコードから呼び出すために`storyboard id`を`TodoEditController`に設定しておきます
![](https://github.com/kaibadash/ios_tutorial/blob/master/img/storyboard_id.png?raw=true)

# 編集画面を作る2
- UI部品を追加し、ソースコードとひも付けておきます。
  - 複数行テキストを書ける`UITextView`
  - 保存ボタンを`UIButton`
  - 右上UINavigationControllerのバー(UINavigationBar)に追加ボタン
  　- `Navigation Item` を置き、その中に `Bar Button Item`を置く

# 画面遷移を設定
今回はToDoの情報を次の画面に渡す必要が有るため、Storyboardで画面遷移を設定する必要はありません。
が、見た目の問題と、UINavigationControllerに積まれていることをわかりやすくする意味があるのでやっておきます。

## Segueの設定(本当はやらなくても良いけど…)
`ViewController`の黄色のアイコンを`ctrl`を押しながらドラッグし、`TodoEditController`に接続します。
![](https://github.com/kaibadash/ios_tutorial/blob/master/img/todo1.png?raw=true)

# 画面遷移のアクション

TodoEditControllerにToDoを1つ渡せるようにしておきます。
```swift
var todo: ToDo? = nil
```

cellをタップした時の処理で、`TodoEditController`に選択したToDoを渡して画面遷移します。
```swift
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let todo: ToDo = todoList[indexPath.row]
    // storyboard_idを指定してインスタンス生成
    let editController: TodoEditController = storyboard?.instantiateViewControllerWithIdentifier("TodoEditController") as! TodoEditController!
    // 選択したToDoを渡す
    editController.todo = todo
    // navigationControllerに積み上げて画面遷移
    navigationController?.pushViewController(editController, animated: true)
}
```

# 保存ボタンのアクション
```swift
@IBAction func saveAction() {
    todo?.title = textView.text!
    // 前の画面に戻る
    navigationController?.popViewControllerAnimated(true)
}
```

# ViewControllerで再描画
```swift
override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
}
```

ここで一旦動作させ、ToDoを変更できることを確認しましょう。

# 削除
次は削除ですが、親に伝える必要があり、一工夫必要です。
`TodoEditController.swift`にインタフェース(protocol)を定義し、親の参照を持ち、親に削除を伝えるようにしてみます。

```swift
// 親に削除を伝えるためのインタフェース
protocol TodoEditControllerDelegate {
    func deleteTodo(todo: ToDo)
}

class TodoEditController: UIViewController {
    @IBOutlet var textView: UITextView!
    var delegate: TodoEditControllerDelegate? = nil
    var todo: ToDo? = nil

```

削除を伝えます。

```swift
@IBAction func deleteAction() {
    // 親に削除を伝える
    delegate!.deleteTodo(todo!)
    navigationController?.popViewControllerAnimated(true)
}
```

`ViewController`でprotocolを実装し、リストからToDoを削除します。
```swift
class ViewController: UITableViewController, TodoEditControllerDelegate {
```

```swift
// TodoEditControllerDelegate
func deleteTodo(todo: ToDo) {
    if let index: Int = todoList.indexOf({$0 === todo}) {
        todoList.removeAtIndex(index)
    }
}
```

動作確認しましょう！
これでチュートリアルはおしまいです！お疲れ様でした！

# まとめ 学んだこと
- UITableViewControllerの使い方
- UINavigationControllerを使った画面遷移
- protocolの使い方

# 終わり
- かなり駆け足で難しくなってしまった感がありますが、UITableViewはよく使う部品ですので表現できるものが多いはずです！
- アプリを終了するとデータが消えてしまいます…
  - サーバサイドを実装してAPIを使ったり
  - ローカルのデータベース(realm, SQLite)に保存したり
