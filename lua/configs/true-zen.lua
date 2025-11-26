local tz_ok, tz = pcall(require, "true-zen")
if not (
      tz_ok
    ) then
  return
end

tz.setup {
  integrations = {
    tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
    kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
      enabled = true,
      font = "+3"
    },
    twilight = true -- enable twilight (ataraxis)
  },
}
