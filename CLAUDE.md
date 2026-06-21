# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Nushell configuration directory on Windows. Changes to `config.nu` or `env.nu` take effect fully only in a new shell session (partial reload via `source` is incomplete because `env.nu` runs before `config.nu`).

## Key commands

```nushell
config nu          # open config.nu in default editor
config nu --doc | nu-highlight | more      # browse all config options with docs
$nu.config-path    # print path to config.nu
$nu.env-path       # print path to env.nu
```

## File structure

| File | Purpose |
|------|---------|
| `config.nu` | Main settings: history (SQLite, 100k lines, isolation), OSC133 disabled |
| `env.nu` | Env vars set before config.nu: `TERM`, `XDG_DATA_HOME` |
| `autoload/yazi.nu` | `y` command — launches yazi and changes to its final directory |
| `vendor/autoload/starship.nu` | Starship prompt (managed by starship, via Scoop) |
| `vendor/autoload/.zoxide.nu` | `z`/`zi` aliases for zoxide directory jumping |

## Conventions

- **`autoload/`** — user-managed scripts, safe to add/edit. Sourced automatically at startup.
- **`vendor/autoload/`** — tool-generated files. Do not edit manually; regenerate with the owning tool (e.g., `starship init nu`, `zoxide init nushell`).
- Tools (starship, zoxide, yazi) are installed via Scoop.

## Adding new integrations

Drop a `.nu` file in `autoload/` and it will be sourced at startup. For new tools that provide their own init scripts (like zoxide or starship), place generated output in `vendor/autoload/` instead.
