## matugen-nvim

Neovim colorscheme that follows a matugen-generated Material You palette.

Highlights:
- Reads a matugen JSON palette and applies full highlight groups.
- Keeps `termguicolors` enabled, with transparent main windows and solid floats.
- Watches the palette file and hot-reloads on changes.
- Optional lualine and snacks.nvim integration.

### Requirements
- Neovim 0.9+ (uses `vim.uv` and `vim.json`)
- A matugen template that outputs JSON

### Matugen template
Add a JSON template and output path in your matugen config:

```toml
[templates.nvim]
input_path  = "~/.config/matugen/templates/nvim.json"
output_path = "~/.cache/matugen/nvim-colors.json"
```

Example template (single file with MD3 + Base16):

```json
{
  "primary": "{{ colors.primary.default.hex }}",
  "on_primary": "{{ colors.on_primary.default.hex }}",
  "primary_container": "{{ colors.primary_container.default.hex }}",
  "on_primary_container": "{{ colors.on_primary_container.default.hex }}",
  "secondary": "{{ colors.secondary.default.hex }}",
  "on_secondary": "{{ colors.on_secondary.default.hex }}",
  "secondary_container": "{{ colors.secondary_container.default.hex }}",
  "on_secondary_container": "{{ colors.on_secondary_container.default.hex }}",
  "tertiary": "{{ colors.tertiary.default.hex }}",
  "on_tertiary": "{{ colors.on_tertiary.default.hex }}",
  "tertiary_container": "{{ colors.tertiary_container.default.hex }}",
  "on_tertiary_container": "{{ colors.on_tertiary_container.default.hex }}",
  "error": "{{ colors.error.default.hex }}",
  "on_error": "{{ colors.on_error.default.hex }}",
  "error_container": "{{ colors.error_container.default.hex }}",
  "on_error_container": "{{ colors.on_error_container.default.hex }}",
  "surface": "{{ colors.surface.default.hex }}",
  "on_surface": "{{ colors.on_surface.default.hex }}",
  "surface_variant": "{{ colors.surface_variant.default.hex }}",
  "on_surface_variant": "{{ colors.on_surface_variant.default.hex }}",
  "background": "{{ colors.background.default.hex }}",
  "on_background": "{{ colors.on_background.default.hex }}",
  "outline": "{{ colors.outline.default.hex }}",
  "outline_variant": "{{ colors.outline_variant.default.hex }}",
  "shadow": "{{ colors.shadow.default.hex }}",
  "scrim": "{{ colors.scrim.default.hex }}",

  "base00": "{{ base16.base00.default.hex }}",
  "base01": "{{ base16.base01.default.hex }}",
  "base02": "{{ base16.base02.default.hex }}",
  "base03": "{{ base16.base03.default.hex }}",
  "base04": "{{ base16.base04.default.hex }}",
  "base05": "{{ base16.base05.default.hex }}",
  "base06": "{{ base16.base06.default.hex }}",
  "base07": "{{ base16.base07.default.hex }}",
  "base08": "{{ base16.base08.default.hex }}",
  "base09": "{{ base16.base09.default.hex }}",
  "base0a": "{{ base16.base0a.default.hex }}",
  "base0b": "{{ base16.base0b.default.hex }}",
  "base0c": "{{ base16.base0c.default.hex }}",
  "base0d": "{{ base16.base0d.default.hex }}",
  "base0e": "{{ base16.base0e.default.hex }}",
  "base0f": "{{ base16.base0f.default.hex }}"
}
```

### Installation (lazy.nvim / LazyVim)

```lua
return {
  {
    "yourname/matugen-nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette_path = "~/.cache/matugen/nvim-colors.json",
      transparent = true,
      watch = true,
      float_bg_blend = 0.6,
      integrations = {
        lualine = true,
        snacks = true,
        blink = true,
      },
    },
  },
}
```

Then set:

```lua
vim.cmd.colorscheme("matugen-nvim")
```

Lualine (preserves your existing options):

```lua
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.theme = require("matugen-nvim.integrations.lualine").get()
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }
  end,
}
```

Lualine will refresh its theme automatically on palette changes.

### Versioning

This project uses 0versioning: `0.x.y`.

### Installation (vim-plug / pack)

`vim-plug`:

```vim
Plug 'yourname/matugen-nvim'
```

`pack` (native packages):

```sh
git clone https://github.com/yourname/matugen-nvim ~/.local/share/nvim/site/pack/matugen/start/matugen-nvim
```

Then in your config:

```lua
require("matugen-nvim").setup({
  palette_path = "~/.cache/matugen/nvim-colors.json",
  transparent = true,
  watch = true,
  float_bg_blend = 0.6,
  integrations = {
    lualine = true,
    snacks = true,
    blink = true,
  },
})

vim.cmd.colorscheme("matugen-nvim")
```

### Configuration

Defaults in `lua/matugen-nvim/config.lua`:

```lua
{
  palette_path = "~/.cache/matugen/nvim-colors.json",
  transparent = true,
  watch = true,
  watch_debounce_ms = 120,
  float_bg_blend = 0.6,
  integrations = {
    lualine = true,
    snacks = true,
    blink = true,
  },
}
```
