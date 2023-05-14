local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.api.nvim_create_autocmd("FileType", {
    pattern = opts.pattern,
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", ":close<cr>", { buffer = event.buf, silent = true })
    end,
  })
end

return M
