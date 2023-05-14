local builtin_patterns = {
  -- from lazyvim
  "PlenaryTestPopup",
  "help",
  "lspinfo",
  "man",
  "notify",
  "qf",
  "spectre_panel",
  "startuptime",
  "tsplayground",
  "checkhealth",

  -- https://github.com/stevearc/overseer.nvim
  "OverseerList",
}

local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("closewithq", { clear = true }),
    pattern = vim.list_extend(builtin_patterns, opts.patterns or {}),
    callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", ":close<cr>", { buffer = event.buf, silent = true })
    end,
  })
end

return M
