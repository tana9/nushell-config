# config.nu
#
# Nushellの設定ファイル。デフォルト値を上書きしたい項目のみ記述する。
# 設定一覧の確認: config nu --doc | nu-highlight | less -R
# このファイルをエディタで開く: config nu

$env.config = {

    # --- 起動 ---
    show_banner: false  # 起動バナーを非表示

    # --- シェル統合 ---
    shell_integration: {
        osc133: false  # OSC133はターミナルによっては表示が乱れるため無効化
    }

    # --- ファイル削除 ---
    rm: {
        always_trash: true  # rm はゴミ箱に移動（完全削除には --permanent を使う）
    }

    # --- 履歴 ---
    history: {
        max_size: 100000       # 履歴の最大保存数
        sync_on_enter: true    # コマンド実行ごとに即時保存
        file_format: "sqlite"  # sqlite（高速・検索可能）または plaintext
    }

    # --- 補完 ---
    completions: {
        case_sensitive: false  # 大文字小文字を区別しない
        quick: true            # 候補が1つなら自動確定
        partial: true          # 部分一致補完を有効化
        algorithm: "fuzzy"     # fuzzy補完（prefix より柔軟）
    }

    # --- カーソル形状 ---
    cursor_shape: {
        emacs: blink_line      # emacsモード（通常）
        vi_insert: blink_line  # viインサートモード
        vi_normal: block       # viノーマルモード
    }

    # --- テーブル表示 ---
    table: {
        mode: rounded          # 枠線スタイル（rounded / heavy / light / none など）
        index_mode: always     # 行番号を常に表示
        trim: {
            methodology: wrapping          # 長いテキストを折り返し表示
            wrapping_try_keep_words: true  # 単語の途中で折り返さない
        }
    }

    # --- カラー ---
    use_ansi_coloring: "auto"  # auto: ターミナルの対応状況を自動検出（推奨）
}


# =============================================================================
# カスタムコマンド
# =============================================================================

# Windowsのゴミ箱を空にする
def "trash clean" [] {
    print "🗑️ ゴミ箱を空にしています..."
    pwsh -c "Clear-RecycleBin -Force"
    print "✨ ゴミ箱を空にしました"
}


# =============================================================================
# 起動時処理
# =============================================================================

# コードページをUTF-8に設定（文字化け防止）
chcp 65001 | ignore
