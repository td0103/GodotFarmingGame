# GodotFarmingGame

## イントロダクション
Godotで農業ゲームを作成しました. 今後ゲームの要素が増えていっても大丈夫なようにプログラムの役割を明確にして, 各プログラムを独立させるように意識しました. また直感的に操作できるように少ないボタンで実装することと, UIを工夫しました. コントローラーでゲームを遊ぶのが好きなのでキーボードの入力のみで完結するようにしました.

## 目次
- [GodotFarmingGame](#godotfarminggame)
  - [イントロダクション](#イントロダクション)
  - [目次](#目次)
  - [ゲームの動画](#ゲームの動画)
  - [制作概要](#制作概要)
  - [ゲームの概要](#ゲームの概要)
	- [ゲームサイクル](#ゲームサイクル)
	- [UI操作](#ui操作)
  - [アピールポイント](#アピールポイント)
  - [使用したAsset](#使用したasset)
  - [特に参考になったもの](#特に参考になったもの)

## ゲームの動画
2分15秒のゲームの動画です
[Farming Game](https://drive.google.com/file/d/17dHHP2MMC8eP6jBfEGvuQiRzKGARN_Zx/view?usp=drive_link
)

## 制作概要
- 制作期間: 1ヶ月
- 開発環境: Godot Engineを利用してGodot Scriptでコードを書いた
- 制作人数: 1人
- 参考: 主にYoutubeとChatGPT, ページ下部に詳細を記載

## ゲームの概要
基本的な操作方法はポーズした状態でControlタブを開く(1や2を押すと表示するタブを変更できる)と表示される.
### ゲームサイクル
少ないボタンで遊ぶことができる農業ゲーム. 基本的には移動キー(WASD)とインタラクトキー(E)のみで完結する. 畑に対してインタラクトすることにより水をあげたり, 種をまいたり(HotbarUIに種がセットされているときに限る), 収穫したりできる. 1日経過することにより作物が成長し, 最終段階で収穫することができる. 収穫したものはNPCに話しかける(インタラクト)ことにより, 売ることができる(種は売値が低い).

### UI操作
Escキーを押したり, NPCに話しかけ, "売る"を選択することによりUIが表示される. 矢印キーで注目するスロットを変えられる. Enterキーでスロットを選択することができ, 選択肢が表示される.

## アピールポイント
- PlayerStateMachineを導入したこと\
PlayerStateMachineを導入することによってPlayerの状態管理が楽になり, デバッグ作業が楽になった
- FarmManagerを導入したこと\
FarmManagerのTileInfo(TileMapの各cellの情報を登録)に作物の情報を入れることにより, 作物に当たり判定を導入せずに収穫することができる. また今後作物以外のものを配置できるようになったとき管理がとても楽になる
- 効率的に開発できるように各UIの役割をシンプルにしたこと\
例えば InventoryUIはインベントリーデータをただ表示させるものであり, インベントリースロットを選択した際の挙動をConfirmUIに任せるように実装する. これにより, ショップ画面を開いたときに表示されるInventoryUIとポーズ画面を開いたときに表示されるInventoryUIは同じものを使えるようになった.

## 使用したAsset
使用している画像(キャラクター, TileMapの草や土, 家やフェンスなどのオブジェクト)は[tiny_realm_asset_pack_free](https://wicked-rabbit.itch.io/tiny-realm-asset-pack)を利用した.


## 特に参考になったもの

- Michael Games, [Make a 2D Action & Adventure RPG in Godot 4](https://www.youtube.com/watch?v=QPeycNt29tY&list=PLfcCiyd_V9GH8M9xd_QKlyU8jryGcy3Xa)\
2D Action RPGの様々な機能の実装を解説している. 何か実装したいことがあったら, このシリーズに似た機能がないか探した.

- Zenva, [GODOT のファーミング RPG チュートリアル - 完全なミニコース](https://www.youtube.com/watch?v=LUg2XZNM4Qk)\
TileMapのcellにcellの状態(土が乾いているか湿っているか)や作物があるかないかの情報を持たせるFarmManagerの解説が参考になった.

- ChatGPT\
わからないことがあったり, エラーが出たら利用した. 参考になるものは真似をした. たまにもっと良い方法がありそうな実装を提案されるので, そのときはYoutubeの動画を検索して, いいとこ取りをした
