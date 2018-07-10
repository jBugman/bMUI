MUI = {}

local robotoFontRegular = 'Interface\\AddOns\\MUI\\fonts/Roboto-Regular.ttf'
local robotoFontLight = 'Interface\\AddOns\\MUI\\fonts/Roboto-Light.ttf'
local robotoFontThin = 'Interface\\AddOns\\MUI\\fonts/Roboto-Thin.ttf'

function MUI.create_font(name, path, size)
  local f = CreateFont(name)
  f:SetFont(path, size)
  f:SetShadowColor(0, 0, 0, 0)
  f:SetTextColor(1, 1, 1, 1)
  return f
end

MUI.fonts = {}
MUI.fonts.regular = MUI.create_font('Roboto13.font', robotoFontRegular, 13)
-- MUI.fonts.small = MUI.create_font('Roboto12.font', robotoFontRegular, 12)
MUI.fonts.light = MUI.create_font('RobotoLight13.font', robotoFontLight, 13)

function MUI.skin_button(button)
  button:SetNormalFontObject(MUI.fonts.regular)
  button:SetHighlightFontObject(MUI.fonts.regular)
end

-- Skin main menu buttons
local menu_frame = GameMenuFrame
local menu_buttons = { menu_frame:GetChildren() }
for _, button in ipairs(menu_buttons) do
  MUI.skin_button(button)
end

GameFontNormalSmall:CopyFontObject(MUI.fonts.small)
GameTooltipText:CopyFontObject(MUI.fonts.regular)
-- Chat
ChatFontNormal:CopyFontObject(MUI.fonts.light)
ChatFontSmall:CopyFontObject(MUI.fonts.light)
-- ObjectiveTracker
ObjectiveFont:CopyFontObject(MUI.fonts.light)
GameFontNormalMed2:CopyFontObject(MUI.fonts.light)

print("MUI initalized")
