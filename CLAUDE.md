# CLAUDE.md

このファイルは、リポジトリ内のコードを扱う Claude Code (claude.ai/code) への案内を提供します。

## 概要

Windows 向けの個人用 Nushell 設定で、`~/.config/nushell/` 以下で管理されています。パッケージ管理には **Scoop** を使用しています。

## ファイル構成

| ファイル / ディレクトリ | 役割 |
|---|---|
| `env.nu` | 最初に読み込まれる — `$env.PATH`・`$env.EDITOR`（`nvim`）・`$env.VISUAL`・`$env.LESS` を定義 |
| `config.nu` | メインのシェル設定 — `$env.config` の各設定値 + カスタムコマンド |
| `autoload/` | 起動時に自動ソースされるスクリプト群（1 ファイル 1 機能） |
| `autoload/starship.nu` | Starship プロンプト統合（`starship init nu` で生成） |
| `autoload/.zoxide.nu` | zoxide 統合 — `z`（ジャンプ）と `zi`（インタラクティブジャンプ）を提供 |
| `autoload/pkill.nu` | Unix ライクな `pkill <name>` — プロセス名の大文字小文字を区別しないパターンマッチでキル |
| `autoload/yazi.nu` | yazi を包む `y` ラッパー — yazi 終了時に移動先ディレクトリへ `cd` する |

## 主要な設定方針

- **履歴**: SQLite 形式（`history.sqlite3`）、最大 10 万件、コマンド実行ごとに即時保存。
- **補完**: fuzzy アルゴリズム、大文字小文字を区別しない、候補 1 件なら自動確定。
- **`rm`**: 常にゴミ箱へ移動。完全削除は `rm --permanent` を使う。`trash clean` で PowerShell 経由のゴミ箱を空にする。
- **OSC133** は無効（一部ターミナルでの表示崩れ防止）。
- **カーソル形状**: Emacs・vi-insert モードは点滅ライン、vi-normal モードはブロック。
- **テーブル**: `rounded` 枠線、行番号を常に表示、長いテキストは折り返し表示。

## 新機能の追加方法

- `.nu` ファイルを `autoload/` に置くだけで、シェル起動時に自動ソースされる。
- 既存のパターンに倣い、1 ファイル 1 ツール・1 関心事を維持する。
- 自動ロードファイルはスコープを共有するため、ベアステートメントより `def`・`alias`・`export-env` を使う。

## 設定の確認・再読み込み

```nushell
# config.nu を nvim で開く
config nu

# 利用可能な設定キーをドキュメント付きで確認
config nu --doc | nu-highlight | less -R

# 現在のセッションで設定を再読み込み
source $nu.config-path
```

## 使用ツール

- **Starship** — クロスシェル対応プロンプト（Scoop 経由の `starship.exe`）
- **zoxide** — 頻度ベースの `cd` 代替
- **yazi** — シェル連携対応のターミナルファイルマネージャ
- **nvim** — デフォルトエディタ（`$EDITOR` / `$VISUAL`）
