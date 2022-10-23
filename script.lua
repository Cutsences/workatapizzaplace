local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


local SelectionBox = Instance.new("SelectionBox",game.Workspace)
SelectionBox.Name = "th"
SelectionBox.LineThickness = 0.05
SelectionBox.Adornee = nil
SelectionBox.Color3 = Color3.fromRGB(255,0,0)
SelectionBox.Visible = false

local IsEquipped = false
local Mouse = game.Players.LocalPlayer:GetMouse()

function DestroyObj(Obj)
	game:GetService("ReplicatedStorage").Channels.HouseChannel:FireServer("PlaceFurniture",Obj or nil,CFrame.new(0,-math.huge,0),0)
end


local Window = OrionLib:MakeWindow({Name = "work at a pizza place old" ,IntroText = "Cutsences X", IntroEnabled = true,HidePremium = false, SaveConfig = true, ConfigFolder = "config"})
--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Change Your Face 3000"
})


Tab:AddTextbox({
	Name = "FaceId",
	Default = "put image id",
	TextDisappear = true,
	Callback = function(Value)
		local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Head.face,
            [2] = "rbxassetid://"..Value
        }
        
        workspace.Main.ChangeFace:FireServer(unpack(args))
        
	end	  
})



local Section = Tab:AddSection({
	Name = "ServerSide"
})

Tab:AddToggle({
	Name = "Click Delete",
	Default = false,
	Callback = function(Value)
		if Value == false then
            SelectionBox.Visible = true
		SelectionBox.Adornee = nil
		IsEquipped = false
       else
        SelectionBox.Visible = true
		SelectionBox.Adornee = nil
		IsEquipped = true
        
    end
	end    
})

Tab:AddButton({
	Name = "Play all sounds at once",
	Callback = function()
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Play()
			end
		 end
  	end    
})
	
Tab:AddButton({
	Name = "Loop Fling (made by: digitality)",
	Callback = function()
		
		loadstring(game:HttpGet('https://github.com/DigitalityScripts/roblox-scripts/raw/main/loop%20fling%20all'))()

  	end    
})


 
Tab:AddButton({
	Name = "bring unanchored gui",
	Callback = function()
		loadstring(game:HttpGetAsync("https://pastebin.com/raw/sLUZamZN"))()
  	end    
})


Tab:AddButton({
	Name = "free moneyz",
	Callback = function()
		
local ohNumber1 = 23491618

workspace.Main.FreeProducts:FireServer(ohNumber1)
  	end    
})
--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
Mouse.Button1Down:Connect(function()
	if IsEquipped then
			DestroyObj(Mouse.Target)
	end
	end)

		
	




function GetPlrByPart(Prt)
	if Prt then
		for _,Plr in pairs(game.Players:GetPlayers()) do
			if Plr.Character then
				if Prt:IsDescendantOf(Plr.Character) then
					return Plr
				end
			end
		end
	end
	return nil

end

while true do
    wait()
if IsEquipped == true then
    SelectionBox.Visible = true
else
    SelectionBox.Visible = false
end
end
while true do
	if GetPlrByPart(Mouse.Target or nil) then
	
	end
	SelectionBox.Adornee = Mouse.Target or nil

	wait(0.1)
	endt(0.1)
end
--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
OrionLib:Init()