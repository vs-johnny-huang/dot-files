-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
  tabufline = {
    lazyload = false,
  },
  telescope = { style = "bordered" }, -- borderless / bordered
}

M.base46 = {
  theme_toggle = { "catppuccin", "tokyonight" },
  theme = "catppuccin",
  hl_override = {
    NvDashAscii = {
      bg = "NONE",
      fg = "nord_blue",
    },
    NvDashButtons = {
      fg = "cyan",
    },
  },
}

M.mason = {
  pkgs = {
    "typescript-language-server",
    "lua-language-server",
    "prettierd",
    "stylua",
    "biome",
  },
}

local home = os.getenv "HOME"
local function read_ascii_art(file_path)
  local art = {}
  local file = io.open(file_path, "r")
  if file then
    for line in file:lines() do
      table.insert(art, line)
    end
    file:close()
  else
    print("Error: Could not open file " .. file_path)
  end
  return art
end

M.nvdash = {
  load_on_startup = true,
  header = function()
    -- Specify the path to your ASCII art file
    local file_path = home .. "/.config/nvim/lua/logo/Star-Wars.txt"
    return read_ascii_art(file_path)
    -- return read_ascii_art(file_path)
  end,
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = " New file", cmd = "ene | startinsert", keys = "n" },
    { txt = " Search Session", cmd = "SessionSearch", keys = "s" },
    { txt = "󰒲 Lazy", cmd = "Lazy", keys = "l" },
    { txt = " Quit", cmd = "qa", keys = "q" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
