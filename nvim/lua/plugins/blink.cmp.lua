return {
  "saghen/blink.cmp",
  dependencies = {
    { "echasnovski/mini.snippets" },
    { "rafamadriz/friendly-snippets" },
    { "giuxtaposition/blink-cmp-copilot" },
  },
  opts = {
    snippets = { preset = "default" },
    completion = {
      menu = { border = "rounded" },
      documentation = { window = { border = "rounded" } },
      keyword = { range = "full" },
      accept = { auto_brackets = { enabled = false } },
      list = { selection = { preselect = false, auto_insert = true } },
    },
    signature = { window = { border = "rounded" } },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "copilot", "lazydev" },
    per_filetype = {
      org = { "orgmode" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
        },
        orgmode = {
          name = "Orgmode",
          module = "orgmode.org.autocompletion.blink",
          fallbacks = "buffer",
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },
    appearance = {
      -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
      kind_icons = {
        Copilot = "",
        Text = "󰉿",
        Method = "󰊕",
        Function = "󰊕",
        Constructor = "󰒓",

        Field = "󰜢",
        Variable = "󰆦",
        Property = "󰖷",

        Class = "󱡠",
        Interface = "󱡠",
        Struct = "󱡠",
        Module = "󰅩",

        Unit = "󰪚",
        Value = "󰦨",
        Enum = "󰦨",
        EnumMember = "󰦨",

        Keyword = "󰻾",
        Constant = "󰏿",

        Snippet = "󱄽",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "󰬛",
      },
    },
  },
}
