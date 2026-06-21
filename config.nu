# config.nu
#
# Installed by:
# version = "0.109.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config = {
    show_banner: false

    edit_mode: "vi"

    cursor_shape: {
        vi_normal: block
        vi_insert: line
    }

    shell_integration: {
        osc133: false
    }

    history: {
        max_size: 100_000
        sync_on_enter: true
        file_format: "sqlite"
        isolation: true
    }

    completions: {
        algorithm: "fuzzy"
        case_sensitive: false
    }

    use_kitty_protocol: true
}
