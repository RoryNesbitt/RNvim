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
	a = { description = { "  Jump to File               -" }, command = "DashboardFindFile" },
	b = { description = { " Jump to bookmarks           -" }, command = "DashboardJumpMarks" },
	c = { description = { "  Recent Files               -" }, command = "DashboardFindHistory" },
	d = { description = { "  Change colorscheme         -" }, command = "DashboardChangeColorscheme" },
	e = { description = { "  Search Text                -" }, command = "DashboardFindWord" },
	f = { description = { "  New file                   -" }, command = "DashboardNewFile" },
	g = { description = { "  Edit Config                -" }, command = "cd ~/.config/nvim/ | DashboardFindFile" },
	h = { description = { "  Update Config              -" }, command = ":!git --git-dir=$HOME/.config/nvim/.git pull" },
}

function pluginCount()
	local i, t, popen = 0, {}, io.popen
	for filename in popen("ls ~/.local/share/nvim/site/pack/packer/start/"):lines() do
		i = i + 1
	end
	return i
end

--local pluginCount = "!ls ~/.local/share/nvim/site/pack/packer/start/ | wc -l"
vim.g.dashboard_custom_footer = { "Neovim loaded with " .. pluginCount() .. " plugins" }

-- Jump to bookmarks                     SPC f b
-- Change colorscheme                    SPC t c
-- Find file                             SPC f f
-- Recently opened files                 SPC f h
-- Find word                             SPC f a
-- New file                              SPC c n
