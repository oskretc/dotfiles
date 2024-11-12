version = '0.21.9'

local home = os.getenv("HOME")
package.path = home
.. "/.config/xplr/plugins/?/init.lua;"
.. home
.. "/.config/xplr/plugins/?.lua;"
.. package.path

require("tri-pane").setup({
  layout_key = "T", -- In switch_layout mode
  as_default_layout = false,
  left_pane_width = { Percentage = 20 },
  middle_pane_width = { Percentage = 50 },
  right_pane_width = { Percentage = 30 },
  left_pane_renderer = custom_function_to_render_left_pane,
  right_pane_renderer = custom_function_to_render_right_pane
})


require("fzf").setup{
  mode = "default",
  key = "ctrl-f",
  bin = "fzf",
  args = "--preview 'pistol {}'",
  recursive = false,  -- If true, search all files under $PWD
  enter_dir = false,  -- Enter if the result is directory
}

local function stat(node)
  return xplr.util.to_yaml(xplr.util.node(node.absolute_path))
end

local function read(path, height)
  local p = io.open(path)

  if p == nil then
    return nil
  end

  local i = 0
  local res = ""
  for line in p:lines() do
    if line:match("[^ -~\n\t]") then
      p:close()
      return
    end

    res = res .. line .. "\n"
    if i == height then
      break
    end
    i = i + 1
  end
  p:close()

  return res
end

xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
  local title = nil
  local body = ""
  local n = ctx.app.focused_node
  if n and n.canonical then
    n = n.canonical
  end

  if n then
    title = { format = n.absolute_path, style = xplr.util.lscolor(n.absolute_path) }
    if n.is_file then
      body = read(n.absolute_path, ctx.layout_size.height) or stat(n)
    else
      body = stat(n)
    end
  end

  return { CustomParagraph = { ui = { title = title }, body = body } }
end

local preview_pane = { Dynamic = "custom.preview_pane.render" }
local split_preview = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 60 },
        { Percentage = 40 },
      },
    },
    splits = {
      "Table",
      preview_pane,
    },
  },
}

xplr.config.layouts.builtin.default =
    xplr.util.layout_replace(xplr.config.layouts.builtin.no_help_no_selection, "Table", split_preview)
