-- File containing all autocommands

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd({ "RecordingEnter", "RecordingLeave", "CmdlineEnter", "CmdlineLeave" }, {
  callback = function()
    if vim.g.CMDHEIGHT == 0 then
      opt.cmdheight = 1
      vim.g.CMDHEIGHT = 1
    else
      opt.cmdheight = 0
      vim.g.CMDHEIGHT = 0
    end
  end,
})

---Highlight yanked text
au("TextYankPost", {
  group = ag("yank_highlight", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
  end,
})
