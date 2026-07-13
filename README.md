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

TypeScriptソースはHomebrew管理下の `libexec` にインストールされ、Homebrew版Bunで直接実行されます。

```sh
cd "$(brew --prefix niwa)/libexec"
vi src/cli.ts
```

ソースの変更は次回の `niwa` 実行から反映されます。`brew upgrade` または `brew reinstall` を実行すると変更は上書きされます。

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

1. `takesako/niwa-cli` でバージョンタグを作成してpushします。

   ```sh
   git tag v0.1.4
   git push origin v0.1.4
   ```

2. ソースtarballのSHA-256を確認します。

   ```sh
   curl -L https://github.com/takesako/niwa-cli/archive/refs/tags/v0.1.4.tar.gz -o niwa-cli-v0.1.4.tar.gz
   shasum -a 256 niwa-cli-v0.1.4.tar.gz
   ```

3. `niwa.rb` の `url` と `sha256` を更新します。

4. Formulaを検査します。

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
