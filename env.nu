# env.nu
#
# config.nu より先に読み込まれる環境変数設定ファイル。
# PATH やエディタなど、起動時に必要な環境変数を定義する。


# PATH
$env.PATH = ($env.PATH | split row (char esep) | prepend [
    ($env.USERPROFILE | path join "scoop/shims")
    ($env.USERPROFILE | path join "scoop/apps/git/current/usr/bin")
] | uniq --ignore-case)

# エディタ
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"

# ページャー
$env.LESS = "-R -i -F"

