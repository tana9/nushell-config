# Nushell 設定

Windows 上の Nushell 設定ファイル一式。

## 構成

| ファイル | 役割 |
|----------|------|
| `config.nu` | メイン設定（履歴・Vi モード・補完など） |
| `env.nu` | 環境変数（`XDG_CONFIG_HOME`、`EDITOR`、`VISUAL`） |
| `autoload/yazi.nu` | `y` コマンド — yazi 終了後に移動先ディレクトリへ cd |
| `autoload/vi-prompt.nu` | Starship の character モジュールに vi インジケータを委譲 |
| `vendor/autoload/.zoxide.nu` | zoxide の `z` / `zi` エイリアス（自動生成） |

`vendor/autoload/` 以下は各ツールが生成するファイルのため手動編集不可。

## インストール

### 1. Scoop のインストール

PowerShell で実行:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### 2. 依存ツールのインストール

```powershell
scoop install nushell starship zoxide yazi
```

### 3. この設定を配置

```powershell
git clone <このリポジトリ> "$env:USERPROFILE\.config\nushell"
```

### 4. 初回セットアップ（Nushell 上で実行）

Nushell を起動後、以下を実行して各ツールの init スクリプトを生成:

```nushell
# Starship
starship init nu | save -f ($env.XDG_CONFIG_HOME | path join "nushell/vendor/autoload/starship.nu")

# zoxide
zoxide init nushell | save -f ($env.XDG_CONFIG_HOME | path join "nushell/vendor/autoload/.zoxide.nu")
```

新しいシェルを開けば設定が反映される。

## 主な設定内容

- **履歴**: SQLite 形式、10万行、セッション分離
- **編集モード**: Vi（ノーマルモード: ブロックカーソル、インサートモード: ラインカーソル）
- **補完**: ファジーマッチ、大文字小文字を区別しない
- **プロンプト**: Starship
