return {
  'stevearc/conform.nvim',
  opts = {
      formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
      },
      format_on_save = false,
  },
}
