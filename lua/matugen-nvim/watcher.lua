local M = {}

local watcher = nil
local debounce = nil

local function schedule_apply(wait_ms)
  if debounce then
    debounce:stop()
  end

  debounce = vim.uv.new_timer()
  debounce:start(wait_ms, 0, vim.schedule_wrap(function()
    if debounce then
      debounce:stop()
      debounce:close()
      debounce = nil
    end
    require("matugen-nvim").apply()
  end))
end

function M.start(path, debounce_ms)
  if watcher then
    return
  end

  local expanded = vim.fn.expand(path)
  local w = vim.uv.new_fs_event()
  if not w then
    return
  end

  watcher = w
  w:start(expanded, {}, function(err, _, events)
    if err then
      return
    end
    if events and events.change then
      schedule_apply(debounce_ms or 120)
    end
  end)
end

function M.stop()
  if watcher then
    watcher:stop()
    watcher:close()
    watcher = nil
  end
  if debounce then
    debounce:stop()
    debounce:close()
    debounce = nil
  end
end

return M
