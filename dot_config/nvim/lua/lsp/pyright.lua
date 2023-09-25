return {
  root_dir = function()
    local dir = vim.fn.FindRootDirectory()
    if dir == "" then
      return vim.fn.getcwd()
    else
      return dir
    end
  end,
}
