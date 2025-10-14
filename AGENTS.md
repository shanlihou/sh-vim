# Repository Guidelines

## Project Structure & Module Organization
- `lua/init.lua` — entry point; loads `lazyinit.lua`, core options, keymaps, and plugin modules.
- `lua/lazyinit.lua` — bootstrap and configure `lazy.nvim`.
- `lua/lazy_plugins/` — plugin specs; one file per tool (e.g., `telescope.lua`).
- `lua/lsp/` — LSP setup, diagnostics, formatters.
- `lua/plugin-config/` — per‑plugin configs referenced by specs.
- `lua/basic/` — options and autocmds; `keybindings.lua` for mappings.

## Build, Test, and Development Commands
- Run health checks: `:checkhealth` (or `nvim --headless "+checkhealth" +qa`).
- Sync plugins: `:Lazy sync` (headless: `nvim --headless "+Lazy! sync" +qa`).
- Reload current file: `:luafile %`; reload mappings/options: `:source $MYVIMRC`.
- Validate LSP: open any buffer, check `:LspInfo` and diagnostics.

## Coding Style & Naming Conventions
- Indentation: 2 spaces, no tabs. Keep lines ≤ 100 chars.
- Lua style: prefer `vim.opt`, `vim.keymap.set`, `vim.api.nvim_*` over Vimscript.
- Modules: return a table `M`; use `snake_case.lua` file names (e.g., `git_signs.lua`).
- Plugin specs in `lua/lazy_plugins/` follow tool‑name files; keep config in `lua/plugin-config/` and require it from the spec.
- Avoid side effects at require time; expose `setup()` when needed.

## Testing Guidelines
- Quick check: open Neovim, source the changed file, inspect `:messages`.
- Lint (optional): `luacheck .` (treat `vim` as a global).
- Add minimal repros in comments near changed functions; remove before merging.

## Commit & Pull Request Guidelines
- Commit messages: `area: intent`.
  - Examples: `lsp: configure diagnostics`, `plugins: add telescope`, `keymap: fix <leader>ff`.
- Pull requests include:
  - Summary of changes and rationale.
  - Screenshots or short demos for UI‑visible changes.
  - Validation steps (e.g., `:Lazy sync`, `:checkhealth`, commands to trigger behavior).

## Security & Configuration Tips
- Do not commit tokens or machine‑local paths. Read env vars via `vim.fn.getenv("NAME")`.
- If needed, add untracked overrides (e.g., `lua/basic/local.lua`) and guard with `pcall(require, 'basic.local')`.

