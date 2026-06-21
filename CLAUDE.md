# CLAUDE.md

このファイルは、リポジトリのコードを扱う際に Claude Code (claude.ai/code) へのガイダンスを提供します。

## 概要

Windows 上の Nushell 設定ディレクトリ。`config.nu` や `env.nu` への変更は、新しいシェルセッションを開いて初めて完全に反映される（`source` による部分的なリロードは不完全。`env.nu` が `config.nu` より先に実行されるため）。

## 主なコマンド

```nushell
config nu          # config.nu をデフォルトエディタで開く
config nu --doc | nu-highlight | less -R   # すべての設定オプションをドキュメント付きで閲覧
$nu.config-path    # config.nu のパスを表示
$nu.env-path       # env.nu のパスを表示
```

## ファイル構成

| ファイル | 役割 |
|----------|------|
| `config.nu` | メイン設定: 履歴 (SQLite、10万行、分離)、OSC133 無効 |
| `env.nu` | config.nu より前に設定される環境変数: `XDG_CONFIG_HOME`、`EDITOR` |
| `autoload/yazi.nu` | `y` コマンド — yazi を起動し、最後にいたディレクトリへ移動 |
| `vendor/autoload/starship.nu` | Starship プロンプト (starship が管理、Scoop 経由) |
| `vendor/autoload/.zoxide.nu` | zoxide のディレクトリジャンプ用 `z`/`zi` エイリアス |

## 規約

- **`autoload/`** — ユーザー管理のスクリプト置き場。追加・編集して問題ない。起動時に自動で source される。
- **`vendor/autoload/`** — ツールが生成したファイル。手動で編集しないこと。ツール本体で再生成する（例: `starship init nu`、`zoxide init nushell`）。
- ツール (starship、zoxide、yazi) は Scoop でインストール。

## 新しいツールの統合

`.nu` ファイルを `autoload/` に置くだけで起動時に自動 source される。zoxide や starship のように独自の init スクリプトを持つツールは、生成した出力を `vendor/autoload/` に置くこと。
