-- Run by install.sh in headless mode: waits for the installs LazyVim starts asynchronously
local M = {}

local TIMEOUT = 15 * 60 * 1000

local function wait_for(what, check)
  assert(vim.wait(TIMEOUT, check, 1000), "timed out waiting for " .. what)
end

function M.run()
  local tools = LazyVim.opts("mason.nvim").ensure_installed or {}
  local mr = require("mason-registry")
  wait_for("mason tools " .. table.concat(tools, ", "), function()
    return vim.iter(tools):all(function(name)
      return mr.get_package(name):is_installed()
    end)
  end)

  local langs = LazyVim.opts("nvim-treesitter").ensure_installed or {}
  require("lazy").load({ plugins = { "nvim-treesitter" } })
  wait_for("treesitter parsers " .. table.concat(langs, ", "), function()
    local installed = LazyVim.treesitter.get_installed(true)
    return vim.iter(langs):all(function(lang)
      return installed[lang] ~= nil
    end)
  end)
end

return M
