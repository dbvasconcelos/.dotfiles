-- Hyprland Window Compositor Configuration.

-- Monitors
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- Look and Feel
hl.config({
	general = {
		border_size = 2,
		gaps_out = 5,
		col = {
			active_border = "rgba(d4be98ee)",
			inactive_border = "rgba(595959aa)",
			nogroup_border = "rgba(595959aa)",
			nogroup_border_active = "rgba(d4be98ee)",
		},
		snap = {
			enabled = true,
		},
	},

	decoration = {
		rounding = 8,
	},

	animations = {
		enabled = false,
	},

	cursor = {
		inactive_timeout = 5,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		enable_swallow = true,
		swallow_regex = [[^(kitty)$]],
		swallow_exception_regex = [[^.* - Nvim$]],
	},
})

-- Layout
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-- Input
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_options = "lv3:caps_switch_capslock_with_ctrl",
	},
})

-- Window Rules
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "float-apps",
	match = {
		class = table.concat({
			"zenity",
			"blueman-manager",
			"com.saivert.pwvucontrol",
			"nm-connection-editor",
			"filechooser",
		}, "|"),
	},
	float = true,
})

hl.window_rule({
	match = { class = "looking-glass-client" },
	workspace = "3",
})

-- Keybindings
local mod = "SUPER"
local keys = function(keys)
	return table.concat(keys, " +")
end
-- Window Status Control.
hl.bind(keys({ mod, "Q" }), hl.dsp.window.close())
hl.bind(keys({ mod, "S" }), hl.dsp.layout("togglesplit"))
hl.bind(keys({ mod, "T" }), hl.dsp.window.float({ action = "toggle" }))
hl.bind(keys({ mod, "F" }), hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(keys({ mod, "O" }), hl.dsp.focus({ last = true }))
hl.bind(keys({ mod, "mouse:272" }), hl.dsp.window.drag(), { mouse = true })
hl.bind(keys({ mod, "mouse:273" }), hl.dsp.window.resize(), { mouse = true })
-- Workspace Controls
for i = 1, 10 do
	local num = i % 10
	hl.bind(keys({ mod, num }), hl.dsp.focus({ workspace = i }))
	hl.bind(keys({ mod, "SHIFT", num }), hl.dsp.window.move({ workspace = i, follow = false }))
end
-- Vim Bindings
for dir, vimbind in pairs({ left = "H", down = "J", up = "K", right = "L" }) do
	hl.bind(keys({ mod, vimbind }), hl.dsp.focus({ direction = dir }))
	hl.bind(keys({ mod, "SHIFT", vimbind }), hl.dsp.window.move({ direction = dir }))
end
-- Arrows
for dir, offset in pairs({ left = { -100, 0 }, down = { 0, 100 }, up = { 0, -100 }, right = { 100, 0 } }) do
	hl.bind(keys({ mod, dir }), hl.dsp.window.resize({ x = offset[1], y = offset[2], relative = true }))
end
-- Apps
local uwsm = function(app)
	return "uwsm app -- " .. app
end
hl.bind(keys({ mod, "Backspace" }), hl.dsp.exec_cmd(uwsm("wleave")))
hl.bind(keys({ mod, "P" }), hl.dsp.exec_cmd(uwsm("hyprshot -m region")))
hl.bind(keys({ mod, "SHIFT", "P" }), hl.dsp.exec_cmd(uwsm("hyprshot -m window")))
hl.bind(keys({ mod, "Return" }), hl.dsp.exec_cmd(uwsm("$TERMINAL")))
hl.bind(keys({ mod, "R" }), hl.dsp.exec_cmd([[rofi -show drun -run-command "uwsm app -- {cmd}"]]))
hl.bind(keys({ mod, "W" }), hl.dsp.exec_cmd(uwsm("$BROWSER")))
hl.bind(keys({ mod, "E" }), hl.dsp.exec_cmd(uwsm("pypr-client toggle filebrowser")))
hl.bind(keys({ mod, "Escape" }), hl.dsp.exec_cmd(uwsm("pypr-client toggle tasks")))
hl.bind(keys({ mod, "Backslash" }), hl.dsp.exec_cmd(uwsm("$TERMINAL --class sessionizer sessionizer")))
