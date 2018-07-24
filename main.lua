local lib = LibStub:NewLibrary('bMUI', 0200000)
if not lib then
  return
end

lib.name = 'bMUI'

lib.colors = {
  orange = 'FF7419'
}

function lib:print(message)
  print('|cFF' .. self.colors.orange .. self.name .. '|r: ' .. message)
end

local robotoFontRegular = 'Interface/AddOns/bMUI/fonts/Roboto-Regular.ttf'
local robotoFontLight = 'Interface/AddOns/bMUI/fonts/Roboto-Light.ttf'

function lib.create_font(name, path, size)
  local f = CreateFont(name)
  f:SetFont(path, size)
  f:SetShadowColor(0, 0, 0, 0)
  f:SetTextColor(1, 1, 1, 1)
  return f
end

lib.fonts = {
  large = lib.create_font('RobotoRegular14.font', robotoFontRegular, 14),
  regular = lib.create_font('RobotoRegular12.font', robotoFontRegular, 12),
  light = lib.create_font('RobotoLight13.font', robotoFontLight, 13)
}

function lib:skin_button(button)
  button:SetNormalFontObject(self.fonts.regular)
  button:SetHighlightFontObject(self.fonts.regular)
end

-- export for messing from the game console
bMUI = lib

lib:print('Initalized')

-- Skin main menu buttons
local menu_frame = GameMenuFrame
local menu_buttons = {menu_frame:GetChildren()}
for _, button in ipairs(menu_buttons) do
  lib:skin_button(button)
end

GameFontNormal:CopyFontObject(lib.fonts.large)
GameFontNormalSmall:CopyFontObject(lib.fonts.regular)
DialogButtonNormalText:CopyFontObject(lib.fonts.regular)
GameTooltipText:CopyFontObject(lib.fonts.regular)
-- Tooltip
GameTooltipHeaderText:CopyFontObject(lib.fonts.large)
-- Chat
ChatFontNormal:CopyFontObject(lib.fonts.light)
ChatFontSmall:CopyFontObject(lib.fonts.light)
-- ObjectiveTracker
ObjectiveTrackerBlocksFrame.QuestHeader.Background:Hide()
local quest_header = ObjectiveTrackerBlocksFrame.QuestHeader.Text
quest_header:SetFont(lib.fonts.large:GetFont())
quest_header:SetTextColor(0.9, 0.9, 0.9, 0.7)
quest_header:SetJustifyH('RIGHT')
quest_header:SetPoint('TOPRIGHT', -8, -3)
ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint('TOPRIGHT', 5, -4)
ObjectiveTrackerFrame.HeaderMenu.Title:SetTextColor(0.9, 0.9, 0.9, 0.7)
ObjectiveTrackerFrame.HeaderMenu.Title:SetJustifyH('RIGHT')
ObjectiveTrackerFrame.HeaderMenu.Title:SetPoint('TOPRIGHT', -18, -4)
-- TODO: ObjectiveTrackerBlocksFrameHeader? HeaderText? :SetTextColor
ObjectiveFont:CopyFontObject(lib.fonts.light)
GameFontNormalMed2:CopyFontObject(lib.fonts.light)

lib:print('Applied UI tweaks')

local SharedMedia = LibStub:GetLibrary('LibSharedMedia-3.0', 6010002)
if not SharedMedia then
  lib:print('Failed to load LibSharedMedia')
  return
end
SharedMedia:Register(SharedMedia.MediaType.FONT, 'Roboto-Regular', robotoFontRegular)
SharedMedia:Register(SharedMedia.MediaType.FONT, 'Roboto-Light', robotoFontLight)

lib:print('Added shared fonts')
