return {
  'h4rdc0m/todo-scanner.nvim',
  dependencies = {
    'nvim-orgmode/orgmode',
  },
  config = function()
    require('todo-scanner').setup({
      orgmode = true,
    })
  end
}
