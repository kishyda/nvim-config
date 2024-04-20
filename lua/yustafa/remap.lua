vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Import necessary libraries
local vim = vim

-- Define the mapping function
local function remap_leader_gl()
	-- Prompt the user for input
	local user_input = vim.fn.input("Go to line: ")
	-- Convert user input to a number
	local line_number = tonumber(user_input)
	-- Check if user_input is a valid number
	if line_number and line_number > 0 then
		-- Go to the specified line
		vim.cmd("normal! " .. line_number .. "G")
	else
		-- Show an error message if input is invalid
		vim.cmd("echoerr 'Invalid line number'")
	end
end

-- Set the mapping
vim.keymap.set("n", "<leader>gl", remap_leader_gl)
