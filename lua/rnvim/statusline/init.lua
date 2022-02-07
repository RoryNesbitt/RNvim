local status_ok, heirline = pcall(require, "heirline")
if not status_ok then
	return
end

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = {
    red = utils.get_highlight("DiagnosticError").fg,
    green = utils.get_highlight("String").fg,
    blue = utils.get_highlight("Function").fg,
    gray = utils.get_highlight("NonText").fg,
    orange = utils.get_highlight("DiagnosticWarn").fg,
    purple = utils.get_highlight("Statement").fg,
    cyan = utils.get_highlight("Special").fg,
    diag = {
        warn = utils.get_highlight("DiagnosticWarn").fg,
        error = utils.get_highlight("DiagnosticError").fg,
        hint = utils.get_highlight("DiagnosticHint").fg,
        info = utils.get_highlight("DiagnosticInfo").fg,
    },
    git = {
        del = utils.get_highlight("diffDeleted").fg,
        add = utils.get_highlight("diffAdded").fg,
        change = utils.get_highlight("diffChanged").fg,
    },
}

local statusline = {
  -- Provider
    -- string|number or function(self) -> string|number|nil
    -- String that is pronted
  -- hl
    -- table or function(self) -> table
    -- fg, bg, guisp, style(italic, bold, underline, undercurl, reverse, nocombine, none)
    -- force (override the child)
  -- condition
    -- function(self) -> any
  -- {...} (list of conditions)
  {},
  {},
  {},
}

heirline.setup(statusline)

-- **Basic fields**:
--
-- - `provider`:
--   - Type: `string|number` or `function(self) -> string|number|nil`
--   - Description: This is the string that gets printed in the statusline. No
--     escaping is performed, so it may contain sequences that have a special
--     meaning within the statusline, such as `%f` (filename), `%p` (percentage
--     through file), `%-05.10(` `%)` (to control text alignment and padding),
--     etc. For more, see `:h 'statusline'`. To print an actual `%`, use `%%`.
-- - `hl`:
--   - Type: `table` or `function(self) -> table`. The table may contain any of:
--     - `fg`: The foreground color. Type: `string` to hex color code or vim
--       builtin color name (eg.: `"#FFFFFF"`, `"red"`).
--     - `bg`: The background color. Type: as above.
--     - `guisp`: The underline/undercurl color, if any. Type: as above.
--     - `style`: Any of the supported comma-separated highlight styles: `italic`,
--       `bold`, `underline`, `undercurl`, `reverse`, `nocombine` or `none`. (eg.:
--       `"bold,italic"`)
--     - `force`: Control whether the parent's `hl` fields will override child's hl.
--       Type: `bool`.
--   - Description: `hl` controls the colors of what is printed by the component's
--     `provider`, or by any of its descendants. At evaluation time, the `hl` of
--     any component gets merged with the `hl` of its parent (whether it is a
--     function or table), so that, when specified, the fields in the child `hl`
--     will always take precedence unless `force` is `true`.
-- - `condition`:
--   - Type: `function(self) -> any`
--   - Description: This function controls whether the component should be
--     evaluated or not. It is the first function to be executed at evaluation
--     time. The truth of the return value is tested, so any value besides `nil`
--     and `false` will evaluate to true. Of course, this will affect all of the
--     component's progeny.
-- - `{...}`:
--   - Type: `list`
--   - Description: The component progeny. Each item of the list is a component
--     itself and may contain any of the basic and advanced fields.
--
-- **Advanced fields**
--
-- - `pick_child`:
--   - Type: `table[int]`
--   - Description: Specify which children and in which order they should be
--     evaluated by indicating their indexes (eg: `{1, 3, 2}`). It makes most
--     sense to modify this attribute from within `init` function using the self
--     parameter to dynamically pick the children to evaluate.
-- - `init`:
--   - Type: `function(self) -> any`
--   - Description: This function is called whenever a component is evaluated
--     (right after `condition` but before `hl` and `provider`), and can be used
--     to modify the state of the component itself via the `self` parameter. For
--     example, you can compute some values that will be accessed from other
--     functions within the component genealogy (even "global" statusline
--     variables).
-- - `static`:
--   - Type: `table`
--   - Description: This is a container for static variables, that is, variables
--     that are computed only once at component definition. This is useful to
--     organize data that should be shared among children, like icons or
--     dictionaries. Any keyword defined within this table can be accessed by the
--     component and its children methods as a direct attribute using the `self`
--     parameter. (eg: `static = { x = ... }` can be accessed as `self.x`
--     somewhere else).
-- - `restrict`:
--   - Type: `table[keyword = bool]`
--   - Description: Set-like table to control which component fields can be
--     inherited by the component's progeny. The supplied table gets merged with
--     the defaults. By default, the following fields are private to the
--     component: `pick_child`, `init`, `provider`, `condition` and `restrict`.
--     Attention: modifying the defaults could dramatically affect the behavior of
--     the component! (eg: `restrict = { my_private_var = true, provider = false }`)
