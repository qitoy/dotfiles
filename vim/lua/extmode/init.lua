local ns = vim.api.nvim_create_namespace("extmode")

function debounce(fn, wait)
  local timer
  return function()
    if timer ~= nil then
      timer:stop()
    end
    timer = vim.uv.new_timer()
    timer:start(wait, 0, function()
      fn()
      timer = nil
    end)
  end
end

local extmode = vim.schedule_wrap(function()
  local extmarks = vim.api.nvim_buf_get_extmarks(0, ns, 0, -1, {})
  for idx, extmark in ipairs(extmarks) do
    vim.api.nvim_buf_del_extmark(0, ns, extmark[1])
  end
  local reg = vim.fn.reg_recording()
  if reg ~= "" then
    vim.api.nvim_buf_set_extmark(0, ns, vim.fn.line(".") - 1, 0, {
      virt_text = { { "@" .. reg, "ModeMsg" } },
      virt_text_pos = "right_align",
    })
  end
end)

vim.on_key(debounce(extmode, 100), ns)
