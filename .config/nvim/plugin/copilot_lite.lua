-- copilot_lite.lua

local M = {}

-- Function to prompt for input
function M.get_user_input()
  local prompt = vim.fn.input("Enter your prompt: ")
  return prompt
end

-- Export the module
return M

