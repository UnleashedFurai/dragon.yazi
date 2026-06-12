-- @since v25.5.31

local function notify_error(msg)
   ya.notify({
		 title = "dragon.yazi",
		 content = msg,
		 level = "error",
		 tmeout = 5,
   })
end

local selected_or_hovered = ya.sync(function()
	  local tab = cx.active
	  local files = {}

	  -- collect selected files
	  for _, u in pairs(tab.selected) do
		 -- quote path with "%q"
		 table.insert(files, string.format("%q", tostring(u)))
	  end

	  -- fall back to currently hovered file if nothing selected
	  if #files == 0 and tab.current.hovered then
		 table.insert(
			files,
			string.format("%q", tostring(tab.current.hovered.url))
		 )
	  end

	  return files
end)

return {
   entry = function(_, job)
	  local args = ""

	  -- map plugin arguments to dragon flags
	  local input = job.args[1]
	  if input == "open" then
		 args = "-x -T"
	  elseif input == "open_keep" then
		 args = "-T"
	  end

	  local files = selected_or_hovered()

	  if #files == 0 then
		 notify_error("No files selected")
		 return
	  end

	  -- build dragon command
	  local cmd = "dragon " .. args .. " " .. table.concat(files, " ") .. " > /dev/null 2>&1"

	  os.execute(cmd)
   end
}
