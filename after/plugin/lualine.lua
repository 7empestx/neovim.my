-- Custom components for enhanced statusline
local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return "No LSP"
  end
  local names = {}
  for _, client in pairs(clients) do
    table.insert(names, client.name)
  end
  return "LSP: " .. table.concat(names, ", ")
end

local function word_count()
  if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
    return vim.fn.wordcount().words .. " words"
  end
  return ""
end

local function get_git_branch()
  local branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
  if branch ~= "" then
    return " " .. branch
  else
    return ""
  end
end

local function macro_recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then return "" end
  return "Recording @" .. reg
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {'neo-tree'},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1,1)
        end
      }
    },
    lualine_b = {
      {
        'branch',
        icon = '',
      },
      {
        'diff',
        symbols = {added = ' ', modified = ' ', removed = ' '},
        colored = true,
      },
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        colored = true,
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        newfile_status = true,
        path = 1, -- Show relative path
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      },
      {
        macro_recording,
        color = { fg = '#ff9e64', gui = 'bold' },
      }
    },
    lualine_x = {
      {
        lsp_status,
        icon = ' ',
        color = { gui = 'italic' },
      },
      {
        word_count,
        color = { fg = '#7dcfff' },
      },
      {
        'encoding',
        fmt = string.upper,
      },
      {
        'fileformat',
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        }
      },
      {
        'filetype',
        colored = true,
        icon_only = false,
      }
    },
    lualine_y = {
      {
        'progress',
        fmt = function(str)
          return str .. "%%"
        end
      }
    },
    lualine_z = {
      {
        'location',
        fmt = function(str)
          return " " .. str
        end
      },
      {
        'datetime',
        style = '%H:%M'
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
      }
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'fugitive', 'trouble', 'neo-tree'}
}