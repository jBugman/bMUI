MUI = {}

local robotoFontRegular = 'Interface\\AddOns\\MUI\\fonts/Roboto-Regular.ttf'
local robotoFontLight = 'Interface\\AddOns\\MUI\\fonts/Roboto-Light.ttf'

function MUI.create_font(name, path, size)
  local f = CreateFont(name)
  f:SetFont(path, size)
  f:SetShadowColor(0, 0, 0, 0)
  f:SetTextColor(1, 1, 1, 1)
  return f
end

MUI.fonts = {}
MUI.fonts.large = MUI.create_font('Roboto13.font', robotoFontRegular, 14)
MUI.fonts.regular = MUI.create_font('Roboto12.font', robotoFontRegular, 12)
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

GameFontNormal:CopyFontObject(MUI.fonts.large)
GameFontNormalSmall:CopyFontObject(MUI.fonts.regular)
DialogButtonNormalText:CopyFontObject(MUI.fonts.regular)
GameTooltipText:CopyFontObject(MUI.fonts.regular)
-- Tooltip
GameTooltipHeaderText:CopyFontObject(MUI.fonts.large)
-- Chat
ChatFontNormal:CopyFontObject(MUI.fonts.light)
ChatFontSmall:CopyFontObject(MUI.fonts.light)
-- ObjectiveTracker
ObjectiveTrackerBlocksFrame.QuestHeader.Background:Hide()
local quest_header = ObjectiveTrackerBlocksFrame.QuestHeader.Text
quest_header:SetFont(MUI.fonts.large:GetFont())
quest_header:SetTextColor(0.9, 0.9, 0.9, 0.7)
quest_header:SetJustifyH('RIGHT')
quest_header:SetPoint('TOPRIGHT', -8, -3)
ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint('TOPRIGHT', 5, -4)
ObjectiveTrackerFrame.HeaderMenu.Title:SetTextColor(0.9, 0.9, 0.9, 0.7)
ObjectiveTrackerFrame.HeaderMenu.Title:SetJustifyH('RIGHT')
ObjectiveTrackerFrame.HeaderMenu.Title:SetPoint('TOPRIGHT', -18, -4)
-- TODO: ObjectiveTrackerBlocksFrameHeader? HeaderText? :SetTextColor
ObjectiveFont:CopyFontObject(MUI.fonts.light)
GameFontNormalMed2:CopyFontObject(MUI.fonts.light)

print("MUI initalized")
