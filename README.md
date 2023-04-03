# search_github
このプロジェクトは、FlutterからRest APIを呼び出すモデルケースです。
[GitHub REST API / Search (Version: 2022-11-28)](https://docs.github.com/en/rest/search?apiVersion=2022-11-28) を利用しています。

This project is for a model case for Flutter's Rest API calls.

This project is created using Flutter and allows you to build iOS & Android apps. When you enter a search term into this app and press the "Done" button on your keyboard, a list of GitHub repositories related to your search term will be displayed. You can also tap one of the GitHub repositories to view the details of that repository.

This project uses [GitHub REST API / Search (Version: 2022-11-28)](https://docs.github.com/en/rest/search?apiVersion=2022-11-28).


## 開発 環境&バージョン
|                    |  Version              |
| :---               |                  ---: |
| Flutter            |  3.3.10 (16 Dec 2022) |
| Xcode              |  14.2 (13 Dec 2022) |
| Visual Studio Code |  1.74                 |


## 対象 OS バージョン
|             |  OS Version                      |
| :---        |                             ---: |
| iOS         | iOS 11 & above                   |
| Android     | API 16 (Android 4.1) & above     |

参照: [Supported platforms in Flutter Document](https://docs.flutter.dev/development/tools/sdk/release-notes/supported-platforms)

## iOS SimulatorまたはAndroid Emulatorからアプリを起動する
プロジェクトを実行する前提として、Flutter(version 3.3.0 & above)がインストールされている必要があります。
iOS Simulatorを用いる場合は、macOSにXcodeをインストールされている必要があります。
また、Android Emulatorを用いる場合は、あらかじめAndroid StudioおよびAndroid Emulatorがインストールされている必要があります。

1. コマンドラインを起動し、プロジェクトをダウンロードしたい任意のdirectoryに移動して、このプロジェクトを `git clone` でダウンロードします。
```bash
git clone https://github.com/mi81ma/search_github.git
```

2. ダウンロードしたプロジェクトのルートフォルダへディレクトリを移動します。
```bash
cd search_github
```

3. `pub get` コマンドでプロジェクトの依存しているライブラリをダウンロードします。
```bash
flutter pub get
```

4. iOS SimulatorまたはAndroid Emulatorのどちらかを起動した状態で、コマンドラインから `flutter run` を実行します。
```bash
flutter run
```


## Integration testの実行
Integration testは、`/integration_test/integration_test.dart` に記述しています。

Integration testを実行するには、コマンドラインでプロジェクトファイルにディレクトリを移動し、次のコマンドを実行してください。

1. Integration testを実行するデバイスのIDを確認します。
次のコマンドを実行することで、iOS Simulatorや Android EmulatorのDevice IDを確認することができます。
```bash
flutter devices
```

2. 表示されたDevice IDを[任意のデバイスID]に入力して、次のコマンドを実行すると、Integration testが起動します。
```bash
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/integration_test.dart -d [任意のデバイスID]
```


## iOS向けビルドファイルを作成する
前提として、Xcode(Version 14.2)が必要です。
1. ターミナルでプロジェクトルートにディレクトリを移動し、次のコマンドを実行して、iOSビルドファイルを作成します。
```bash
flutter build ios
```
2. Visual Studio Codeでプロジェクトを開いている場合は、File ExplorerのiOSフォルダを右クリックし、"Open in Xcode"の項目を選択することで、Xcodeが起動します。


## Android向けのAPKファイルを作成する
1. ターミナルでプロジェクトルートにディレクトリを移動し、次のコマンドを実行することで、APKファイルが作成されます。
```bash
flutter build apk --debug
```

2. ビルドに成功すると、`build/app/outputs/flutter-apk/` フォルダの直下に`app.apk` が作成されます。


## 困った点 & 改善点
- `mockito: 5.3.2` を使ってRest APIのモックを作り、テストしたかったのですが上手く書くことができませんでした。
- Image WidgetのWidget testに失敗しました。参考になる書き方を探しております。
