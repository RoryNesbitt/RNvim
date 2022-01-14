vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = {
	[[██████╗ ███╗   ██╗██████╗]],
	[[██╔══██╗████╗  ██║██╔══██╗]],
	[[██████╔╝██╔██╗ ██║██║  ██║]],
	[[██╔══██╗██║╚██╗██║██║  ██║]],
	[[██║  ██║██║ ╚████║██████╔╝]],
	[[╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝]],
}

vim.g.dashboard_custom_center = { "lol test" }
vim.g.dashboard_custom_section = {
	a = { description = { "  Jump to File" }, command = "DashboardFindFile" },
	b = { description = { "  Recent Files" }, command = "DashboardFindHistory" },
	c = { description = { "  Change colorscheme" }, command = "DashboardChangeColorscheme" },
	d = { description = { "  Search Text" }, command = "DashboardFindWord" },
	e = { description = { "  New file" }, command = "DashboardNewFile" },
	f = { description = { "  Config" }, command = "cd ~/.config/nvim/ | DashboardFindFile" },
}

function pluginCount()
	local i, t, popen = 0, {}, io.popen
	for filename in popen("ls ~/.local/share/nvim/site/pack/packer/start/"):lines() do
		i = i + 1
	end
	return i
end

--local pluginCount = "!ls ~/.local/share/nvim/site/pack/packer/start/ | wc -l"
vim.g.dashboard_custom_footer = { "NeoVim loaded with " .. pluginCount() .. " plugins" }

-- Jump to bookmarks                     SPC f b
-- Change colorscheme                    SPC t c
-- Find file                             SPC f f
-- Recently opened files                 SPC f h
-- Find word                             SPC f a
-- New file                              SPC c n
