# Homebrew tap for にわ語

にわ語のコマンドライン処理系をHomebrewでインストールするためのtapです。

## インストール

```sh
brew install takesako/niwa/niwa
```

インストール後は次のように実行できます。

```sh
niwa -e '「こんにちは」 と いう'
niwa program.niwa
```

## 更新

```sh
brew update
brew upgrade niwa
```

## アンインストール

```sh
brew uninstall niwa
brew untap takesako/niwa
```

## リリース手順

1. `takesako/niwa` にタグを作成します。

   ```sh
   git tag v0.1.1
   git push origin v0.1.1
   ```

2. GitHub Releasesの `v0.1.1` に `niwa-cli-0.1.1.tgz` を添付します。

3. 配布ファイルのSHA-256を確認します。

   ```sh
   shasum -a 256 niwa-cli-0.1.1.tgz
   ```

4. `Formula/niwa.rb` の `url`、`sha256`、必要ならバージョンを更新します。

5. Formulaを検査します。

   ```sh
   brew tap takesako/niwa
   brew audit --strict --online takesako/niwa/niwa
   brew test takesako/niwa/niwa
   ```

## リポジトリ名

このリポジトリはGitHub上で次の名前にします。

```text
takesako/homebrew-niwa
```

Homebrewは `homebrew-` を省略して `takesako/niwa` というtap名で参照します。
