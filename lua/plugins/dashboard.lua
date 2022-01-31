vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_center = { "lol test" }
vim.g.dashboard_custom_section = {
	a = { description = { "  Jump to File               -" }, command = "DashboardFindFile" },
	b = { description = { "  Jump to bookmarks          -" }, command = "DashboardJumpMarks" },
	c = { description = { "  Recent Files               -" }, command = "DashboardFindHistory" },
	d = { description = { "  Change colorscheme         -" }, command = "DashboardChangeColorscheme" },
	e = { description = { "  Search Text                -" }, command = "DashboardFindWord" },
	f = { description = { "  New file                   -" }, command = "DashboardNewFile" },
	g = { description = { "  Edit Config                -" }, command = "cd ~/.config/nvim/ | DashboardFindFile" },
	h = { description = { "  Update Config              -" }, command = ":echo 'Pulling config' | echo system('git --git-dir=$HOME/.config/nvim/.git --work-tree=$HOME/.config/nvim/ pull') | so $HOME/.config/nvim/lua/packer-init.lua | PackerSync | echo 'Restart Neovim to see any changes'" },
}

function pluginCount()
	local i, t, popen = 0, {}, io.popen
	for filename in popen("ls ~/.local/share/nvim/site/pack/packer/start/"):lines() do
		i = i + 1
	end
	for filename in popen("ls ~/.local/share/nvim/site/pack/packer/opt/"):lines() do
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

local logos = {
  {
    [[██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗]],
    [[██╔══██╗████╗  ██║██║   ██║██║████╗ ████║]],
    [[██████╔╝██╔██╗ ██║██║   ██║██║██╔████╔██║]],
    [[██╔══██╗██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  },
  {
    [[    ____  _   __      _]],
    [[   / __ \/ | / /   __(_)___ ___]],
    [[  / /_/ /  |/ / | / / / __ `__ \]],
    [[ / _, _/ /|  /| |/ / / / / / / /]],
    [[/_/ |_/_/ |_/ |___/_/_/ /_/ /_/]],
  },
  {
    [[  ____  _   _       _]],
    [[ |  _ \| \ | |_   _(_)_ __ ___]],
    [[ | |_) |  \| \ \ / / | '_ ` _ \]],
    [[ |  _ <| |\  |\ V /| | | | | | |]],
    [[ |_| \_\_| \_| \_/ |_|_| |_| |_|]],
  },
  {
    [[I <3 Neovim]]
  },
  {
    [[                                    ▄▄]],
    [[▀███▀▀▀██▄ ▀███▄   ▀███▀            ██]],
    [[  ██   ▀██▄  ███▄    █]],
    [[  ██   ▄██   █ ███   █ ▀██▀   ▀██▀▀███ ▀████████▄█████▄]],
    [[  ███████    █  ▀██▄ █   ██   ▄█    ██   ██    ██    ██]],
    [[  ██  ██▄    █   ▀██▄█    ██ ▄█     ██   ██    ██    ██]],
    [[  ██   ▀██▄  █     ███     ███      ██   ██    ██    ██]],
    [[▄████▄ ▄███▄███▄    ██      █     ▄████▄████  ████  ████▄]],
  },
  -- {
  --   [[░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░]],
  --   [[░        ░░░░░    ░░░░░   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░]],
  --   [[▒   ▒▒▒▒   ▒▒▒  ▒   ▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒]],
  --   [[▒   ▒▒▒▒   ▒▒▒   ▒   ▒▒   ▒   ▒▒▒▒▒   ▒▒▒▒▒    ▒   ▒   ▒]],
  --   [[▓  ▓   ▓▓▓▓▓▓▓   ▓▓   ▓   ▓▓   ▓▓▓   ▓▓   ▓▓   ▓▓  ▓▓  ▓]],
  --   [[▓   ▓▓   ▓▓▓▓▓   ▓▓▓  ▓   ▓▓▓   ▓   ▓▓▓   ▓▓   ▓▓  ▓▓  ▓]],
  --   [[▓   ▓▓▓▓   ▓▓▓   ▓▓▓▓  ▓  ▓▓▓▓     ▓▓▓▓   ▓▓   ▓▓  ▓▓  ▓]],
  --   [[█   ██████   █   ██████   █████   █████   █    ██  ██  █]],
  --   [[████████████████████████████████████████████████████████]],
  -- },
  {
    [[ ██▀███   ███▄    █  ██▒   █▓  ██▓ ███▄ ▄███▓]],
    [[▓██ ▒ ██▒ ██ ▀█   █ ▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒]],
    [[▓██ ░▄█ ▒▓██  ▀█ ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░]],
    [[▒██▀▀█▄  ▓██▒  ▐▌██▒  ▒██ █░░░░██░▒██    ▒██]],
    [[░██▓ ▒██▒▒██░   ▓██░   ▒▀█░  ░░██░▒██▒   ░██▒]],
    [[░ ▒▓ ░▒▓░░ ▒░   ▒ ▒    ░ ▐░   ░▓  ░ ▒░   ░  ░]],
    [[  ░▒ ░ ▒░░ ░░   ░ ▒░   ░ ░░  ░ ▒ ░░  ░      ░]],
    [[   ░   ░    ░   ░ ░       ░  ░ ▒ ░░      ░]],
    [[   ░              ░       ░    ░         ░]],
  },
  {
    [[ _______  __    __           __]],
    [[|       \|  \  |  \         |  \]],
    [[| ▓▓▓▓▓▓▓\ ▓▓\ | ▓▓__     __ \▓▓______ ____]],
    [[| ▓▓__| ▓▓ ▓▓▓\| ▓▓  \   /  \  \      \    \]],
    [[| ▓▓    ▓▓ ▓▓▓▓\ ▓▓\▓▓\ /  ▓▓ ▓▓ ▓▓▓▓▓▓\▓▓▓▓\]],
    [[| ▓▓▓▓▓▓▓\ ▓▓\▓▓ ▓▓ \▓▓\  ▓▓| ▓▓ ▓▓ | ▓▓ | ▓▓]],
    [[| ▓▓  | ▓▓ ▓▓ \▓▓▓▓  \▓▓ ▓▓ | ▓▓ ▓▓ | ▓▓ | ▓▓]],
    [[| ▓▓  | ▓▓ ▓▓  \▓▓▓   \▓▓▓  | ▓▓ ▓▓ | ▓▓ | ▓▓]],
    [[ \▓▓   \▓▓\▓▓   \▓▓    \▓    \▓▓\▓▓  \▓▓  \▓▓]],
  },
  {
    [[ █▒▒▒▒▒▒▒     █▒▒▒     █▒▒]],
    [[ █▒▒    █▒▒   █▒ █▒▒   █▒▒              █▒]],
    [[ █▒▒    █▒▒   █▒▒ █▒▒  █▒▒ █▒▒     █▒▒     █▒▒▒ █▒▒ █▒▒]],
    [[ █▒ █▒▒       █▒▒  █▒▒ █▒▒  █▒▒   █▒▒  █▒▒  █▒▒  █▒  █▒▒]],
    [[ █▒▒  █▒▒     █▒▒   █▒ █▒▒   █▒▒ █▒▒   █▒▒  █▒▒  █▒  █▒▒]],
    [[ █▒▒    █▒▒   █▒▒    █▒ ▒▒    █▒█▒▒    █▒▒  █▒▒  █▒  █▒▒]],
    [[ █▒▒      █▒▒ █▒▒      █▒▒     █▒▒     █▒▒ █▒▒▒  █▒  █▒▒]],
  },
  {
    [[░░░░░░  ░░░    ░░ ░░    ░░ ░░ ░░░    ░░░]],
    [[▒▒   ▒▒ ▒▒▒▒   ▒▒ ▒▒    ▒▒ ▒▒ ▒▒▒▒  ▒▒▒▒]],
    [[▒▒▒▒▒▒  ▒▒ ▒▒  ▒▒ ▒▒    ▒▒ ▒▒ ▒▒ ▒▒▒▒ ▒▒]],
    [[▓▓   ▓▓ ▓▓  ▓▓ ▓▓  ▓▓  ▓▓  ▓▓ ▓▓  ▓▓  ▓▓]],
    [[██   ██ ██   ████   ████   ██ ██      ██]],
  },
  -- {
  --   [[RRRRRRRRRRRRRRRRR   NNNNNNNN        NNNNNNNN                           iiii]],
  --   [[R::::::::::::::::R  N:::::::N       N::::::N                          i::::i]],
  --   [[R::::::RRRRRR:::::R N::::::::N      N::::::N                           iiii]],
  --   [[RR:::::R     R:::::RN:::::::::N     N::::::N]],
  --   [[  R::::R     R:::::RN::::::::::N    N::::::Nvvvvvvv           vvvvvvviiiiiii    mmmmmmm    mmmmmmm]],
  --   [[  R::::R     R:::::RN:::::::::::N   N::::::N v:::::v         v:::::v i:::::i  mm:::::::m  m:::::::mm]],
  --   [[  R::::RRRRRR:::::R N:::::::N::::N  N::::::N  v:::::v       v:::::v   i::::i m::::::::::mm::::::::::m]],
  --   [[  R:::::::::::::RR  N::::::N N::::N N::::::N   v:::::v     v:::::v    i::::i m::::::::::::::::::::::m]],
  --   [[  R::::RRRRRR:::::R N::::::N  N::::N:::::::N    v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m]],
  --   [[  R::::R     R:::::RN::::::N   N:::::::::::N     v:::::v v:::::v      i::::i m::::m   m::::m   m::::m]],
  --   [[  R::::R     R:::::RN::::::N    N::::::::::N      v:::::v:::::v       i::::i m::::m   m::::m   m::::m]],
  --   [[  R::::R     R:::::RN::::::N     N:::::::::N       v:::::::::v        i::::i m::::m   m::::m   m::::m]],
  --   [[RR:::::R     R:::::RN::::::N      N::::::::N        v:::::::v        i::::::im::::m   m::::m   m::::m]],
  --   [[R::::::R     R:::::RN::::::N       N:::::::N         v:::::v         i::::::im::::m   m::::m   m::::m]],
  --   [[R::::::R     R:::::RN::::::N        N::::::N          v:::v          i::::::im::::m   m::::m   m::::m]],
  --   [[RRRRRRRR     RRRRRRRNNNNNNNN         NNNNNNN           vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm]]
  -- },
  {
    [[ ▒▒▒▒▒▒▒   ▒▒▒▒     ▒▒          ▒▒]],
    [[/▒▒////▒▒ /▒▒/▒▒   /▒▒         //]],
    [[/▒▒   /▒▒ /▒▒//▒▒  /▒▒ ▒▒    ▒▒ ▒▒ ▒▒▒▒▒▒▒▒▒▒]],
    [[/▒▒▒▒▒▒▒  /▒▒ //▒▒ /▒▒/▒▒   /▒▒/▒▒//▒▒//▒▒//▒▒]],
    [[/▒▒///▒▒  /▒▒  //▒▒/▒▒//▒▒ /▒▒ /▒▒ /▒▒ /▒▒ /▒▒]],
    [[/▒▒  //▒▒ /▒▒   //▒▒▒▒ //▒▒▒▒  /▒▒ /▒▒ /▒▒ /▒▒]],
    [[/▒▒   //▒▒/▒▒    //▒▒▒  //▒▒   /▒▒ ▒▒▒ /▒▒ /▒▒]],
    [[//     // //      ///    //    // ///  //  //]],
  },
  {
    [[# #     #   #                #   ######   #########]],
    [[# #     #   #        #       #     #              #]],
    [[       #  ##########  #     #  ##########         #]],
    [[      #     #     #        #       #      ########]],
    [[    ##      #            ##        #             #]],
    [[  ##        #          ##          #             #]],
    [[##           ######  ##             ####  ########]],
  },
  {
    [[    _/_/_/    _/      _/              _/]],
    [[   _/    _/  _/_/    _/  _/      _/      _/_/_/  _/_/]],
    [[  _/_/_/    _/  _/  _/  _/      _/  _/  _/    _/    _/]],
    [[ _/    _/  _/    _/_/    _/  _/    _/  _/    _/    _/]],
    [[_/    _/  _/      _/      _/      _/  _/    _/    _/]],
  },
  {
    [[RRRRRRRR.  NNNN    NNN          .i.]],
    [[RRR   RRRR NNNNN   NNN          'i']],
    [[RRR    RRR NNNNNN  NNN]],
    [[RRR   RRRR NNNNNNN NNN vvv  vvv iii mmmmmm.mmmm.]],
    [[RRRRRRRR"  NNN NNNNNNN vvv  vvv iii mmm "mmm "mmm]],
    [[RRR RRRR   NNN  NNNNNN vvv  vvv iii mmm  mmm  mmm]],
    [[RRR  RRRR  NNN   NNNNN  vvvvvv  iii mmm  mmm  mmm]],
    [[RRR   RRRR NNN    NNNN   vvvv   iii mmm  mmm  mmm]],
  },
  {
    [[ ▓▓▓▓▓▓▓   ▓▓▓▓     ▓▓          ▓▓]],
    [[/▓▓////▓▓ /▓▓/▓▓   /▓▓         //]],
    [[/▓▓   /▓▓ /▓▓//▓▓  /▓▓ ▓▓    ▓▓ ▓▓ ▓▓▓▓▓▓▓▓▓▓]],
    [[/▓▓▓▓▓▓▓  /▓▓ //▓▓ /▓▓/▓▓   /▓▓/▓▓//▓▓//▓▓//▓▓]],
    [[/▓▓///▓▓  /▓▓  //▓▓/▓▓//▓▓ /▓▓ /▓▓ /▓▓ /▓▓ /▓▓]],
    [[/▓▓  //▓▓ /▓▓   //▓▓▓▓ //▓▓▓▓  /▓▓ /▓▓ /▓▓ /▓▓]],
    [[/▓▓   //▓▓/▓▓    //▓▓▓  //▓▓   /▓▓ ▓▓▓ /▓▓ /▓▓]],
    [[//     // //      ///    //    // ///  //  //]],
  },
}

math.randomseed(os.time())
s = math.random(1,#logos)
vim.g.dashboard_custom_header = logos[s]
