return {
  'nanozuki/tabby.nvim',
  config = function()
    vim.o.showtabline = 2
    require('tabby').setup({
      preset = 'active_wins_at_tail',
      option = {
        theme = {
          fill = 'TabLineFill',
          head = 'TabLine',
          current_tab = 'TabLineSel',
          tab = 'TabLine',
          win = 'TabLine',
          tail = 'TabLine',
        },
        nerdfont = true,
        buf_name = {
          mode = 'unique',
          override = function(bufid)
            if vim.bo[bufid].buftype == 'terminal' then
              return '󰈺 fish'
            end
          end,
        },
      },
    })
  end,
}
