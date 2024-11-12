local scroll_speed = 1
local max_speed = 5
local acceleration = 0.1
local deceleration = 0.05

function _G.scroll(direction)
  vim.cmd("normal! " .. scroll_speed .. direction)
  if scroll_speed < max_speed then
    scroll_speed = scroll_speed + acceleration
  end
end

function _G.reset_scroll_speed()
  scroll_speed = 1
end

vim.api.nvim_set_keymap("n", "<C-e>", "", {
  noremap = true,
  silent = true,
  callback = function()
    _G.scroll("j")
  end,
})

vim.api.nvim_set_keymap("n", "<C-y>", "", {
  noremap = true,
  silent = true,
  callback = function()
    _G.scroll("k")
  end,
})

vim.api.nvim_set_keymap("n", "<C-u>", "", {
  noremap = true,
  silent = true,
  callback = function()
    _G.scroll("5k")
  end,
})

vim.api.nvim_set_keymap("n", "<C-d>", "", {
  noremap = true,
  silent = true,
  callback = function()
    _G.scroll("5j")
  end,
})

vim.cmd("autocmd CursorMoved,CursorMovedI * lua _G.reset_scroll_speed()")

