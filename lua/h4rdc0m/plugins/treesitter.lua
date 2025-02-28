return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windowwp/nvim-ts-autotag",
  },
  config = function ()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "bash"
        "c",
        "c3",
        "cmake",
        "cobol",
        "comment",
        "cpp",
        "csharp",
        "css",
        "csv",
        "dockerfile",
        "editorconfig",
        "erlang",
        "go",
        "json",
        "java",
        "javascript",
        "kotlin",
        "lua",
        "meson",
        "python",
        "odin",
        "swift",
        "sql",
        "twig",
        "toml",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "rust",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      rainbow = {
        enable = true,
        disable = { "html" },
        extended_mode = false,
        max_file_lines = nil,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
