return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  dynamicRegistration = true,
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, { name = "lazydev", group_index = 0 })
  end,
  config = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    local protocol = require("vim.lsp.protocol")

    local on_attach = function(client, bufnr)
      -- Format on save
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mason_lspconfig.setup_handlers({
      function(server)
        nvim_lsp[server].setup({
          capabilities = capabilities,
        })
      end,
      ["intelephense"] = function()
        nvim_lsp["intelephense"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          root_dir = function()
            return vim.loop.cwd()
          end,
          settings = {
            intelephense = {
              files = {
                maxSize = 4000000,
              }
            }
          }
        })
      end,
      ["ts_ls"] = function()
        nvim_lsp["ts_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["cssls"] = function()
        nvim_lsp["cssls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["html"] = function()
        nvim_lsp["html"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["jsonls"] = function()
        nvim_lsp["jsonls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["eslint"] = function()
        nvim_lsp["eslint"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["pyright"] = function()
        nvim_lsp["pyright"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["twiggy_language_server"] = function()
        nvim_lsp["twiggy_language_server"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          init_options = {
            dynamicRegistration = false, -- Force geen dynamische registratie
          },
          settings = {
            twiggy = {
              diagnostics = {
                twigCsFixer = true,
              },
              framework = "symfony",
              symfonyConsolePath = "bin/console",
              phpExecutable = "C:\\Users\\hardc\\.config\\herd\\bin\\php83\\php.exe",
            },
          },
          -- Beperk de analyse tot relevante bestandstypen en voorkom dat vendor-mappen worden gescand.
          filetypes = { "php", "twig" },
        })
      end,
      ["emmet_language_server"] = function()
        nvim_lsp["emmet_language_server"].setup({
          filetypes = { "css", "eruby", "html", "twig", "html.twig", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
        })
      end,
      ["phpactor"] = function()
        nvim_lsp["phpactor"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          init_options = {
            include = {
              "composer.json",
              "phpactor.json",
              "phpactor.yml",
              "phpactor.yaml",
            },
          },
        })
      end,
    })
  end,
}
