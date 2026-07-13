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

1. `takesako/niwa-cli` でBun単体バイナリを作成します。

   ```sh
   bun run build:binaries
   ```

   現在のOS・CPU向けだけを作成する場合は `bun run build:binary` を使います。

2. バージョンタグを作成してpushします。

   ```sh
   git tag v0.1.2
   git push origin v0.1.2
   ```

3. GitHub Releasesの `v0.1.2` に `build/niwa-*` を添付します。

4. macOS/Linux用バイナリのSHA-256を確認します。

   ```sh
   shasum -a 256 build/niwa-darwin-* build/niwa-linux-*
   ```

5. `niwa.rb` の `version`、`url`、`sha256` を更新します。

6. Formulaを検査します。

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
