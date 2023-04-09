local flyEnabled = false
local flying = false

local noclipEnabled = false
local noclipping = false

-- Gui to Lua
-- Version: 3.2

-- Instances:

local gui = Instance.new("ScreenGui")
local topbar = Instance.new("Frame")
local frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local corner = Instance.new("TextButton")
local reopen = Instance.new("TextButton")
local UIGridLayout = Instance.new("UIGridLayout")
local fly = Instance.new("Frame")
local flyLabel = Instance.new("TextLabel")
local flyButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local noclip = Instance.new("Frame")
local noclipLabel = Instance.new("TextLabel")
local noclipButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

--Properties:

if(game["Run Service"]:IsStudio()) then
	gui.Parent = game.Players.LocalPlayer.PlayerGui
else
	gui.Parent = game.CoreGui
end

gui.Name = "km7piggy"

topbar.Name = "topbar"
topbar.Parent = gui
topbar.AnchorPoint = Vector2.new(0.5, 0.5)
topbar.BackgroundColor3 = Color3.fromRGB(62, 62, 70)
topbar.Position = UDim2.new(0.5, 0, 0, -450)
topbar.Size = UDim2.new(0, 375, 0, 30)

frame.Name = "frame"
frame.Parent = topbar
frame.BackgroundColor3 = Color3.fromRGB(72, 72, 80)
frame.Position = UDim2.new(0, 0, 0.833333313, 0)
frame.Size = UDim2.new(0, 375, 0, 400)

UICorner.CornerRadius = UDim.new(0, 1)
UICorner.Parent = frame

UICorner_2.CornerRadius = UDim.new(0, 1)
UICorner_2.Parent = topbar

corner.Name = "corner"
corner.Parent = topbar
corner.BackgroundColor3 = Color3.fromRGB(81, 81, 88)
corner.Position = UDim2.new(0.920000017, 0, 0, 0)
corner.Size = UDim2.new(0, 30, 0, 25)
corner.Font = Enum.Font.SourceSans
corner.Text = ">"
corner.TextColor3 = Color3.fromRGB(255, 255, 255)
corner.TextScaled = true
corner.TextSize = 14.000
corner.TextWrapped = true

reopen.Name = "reopen"
reopen.Parent = topbar
reopen.AnchorPoint = Vector2.new(1, 0)
reopen.BackgroundColor3 = Color3.fromRGB(81, 81, 88)
reopen.Size = UDim2.new(0, 0, 0, 25)
reopen.Visible = false
reopen.Font = Enum.Font.SourceSans
reopen.Text = "<"
reopen.TextColor3 = Color3.fromRGB(255, 255, 255)
reopen.TextScaled = true
reopen.TextSize = 14.000
reopen.TextWrapped = true

UIGridLayout.Parent = frame
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 150, 0, 60)

fly.Name = "fly"
fly.Parent = frame
fly.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fly.BackgroundTransparency = 0.900
fly.Size = UDim2.new(0, 100, 0, 100)

flyLabel.Name = "Label"
flyLabel.Parent = fly
flyLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
flyLabel.BackgroundTransparency = 1.000
flyLabel.Size = UDim2.new(1, -60, 0, 60)
flyLabel.Font = Enum.Font.SourceSans
flyLabel.Text = "Fly (Double Jump)"
flyLabel.TextColor3 = Color3.fromRGB(197, 197, 197)
flyLabel.TextScaled = true
flyLabel.TextSize = 14.000
flyLabel.TextWrapped = true

flyButton.Name = "flyButton"
flyButton.Parent = fly
flyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
flyButton.BackgroundTransparency = 0.600
flyButton.Position = UDim2.new(1, -60, 0, 0)
flyButton.Size = UDim2.new(0, 60, 0, 60)
flyButton.Font = Enum.Font.SourceSans
flyButton.Text = "Off"
flyButton.TextColor3 = Color3.fromRGB(197, 197, 197)
flyButton.TextSize = 40.000
flyButton.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = flyButton

noclip.Name = "noclip"
noclip.Parent = frame
noclip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
noclip.BackgroundTransparency = 0.900
noclip.Size = UDim2.new(0, 100, 0, 100)

noclipLabel.Name = "Label"
noclipLabel.Parent = noclip
noclipLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
noclipLabel.BackgroundTransparency = 1.000
noclipLabel.Size = UDim2.new(1, -60, 0, 60)
noclipLabel.Font = Enum.Font.SourceSans
noclipLabel.Text = "Noclip (RShift)"
noclipLabel.TextColor3 = Color3.fromRGB(197, 197, 197)
noclipLabel.TextScaled = true
noclipLabel.TextSize = 14.000
noclipLabel.TextWrapped = true

noclipButton.Name = "noclipButton"
noclipButton.Parent = noclip
noclipButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
noclipButton.BackgroundTransparency = 0.600
noclipButton.Position = UDim2.new(1, -60, 0, 0)
noclipButton.Size = UDim2.new(0, 60, 0, 60)
noclipButton.Font = Enum.Font.SourceSans
noclipButton.Text = "Off"
noclipButton.TextColor3 = Color3.fromRGB(197, 197, 197)
noclipButton.TextSize = 40.000
noclipButton.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(1, 0)
UICorner_4.Parent = noclipButton

-- Scripts:

local function DBGTEGR_fake_script() -- topbar.LocalScript 
	local script = Instance.new('LocalScript', topbar)

	local oldPos

	local open = false
	local db = false

	script.Parent.corner.MouseButton1Click:Connect(function()
		if open == true and db == true then
			script.Parent.Active = false
			script.Parent.Draggable = false
			db = false
			open = false
			oldPos = script.Parent.Position
			local toPos = UDim2.new(1,script.Parent.Size.X.Offset / 2 + 1,script.Parent.Position.Y.Scale,script.Parent.Position.Y.Offset)
			game.TweenService:Create(script.Parent,TweenInfo.new(.6),{Position = toPos}):Play()
			wait(.6)
			game.TweenService:Create(script.Parent.reopen,TweenInfo.new(.1),{Size = UDim2.new(0,20,0,25)}):Play()
			script.Parent.reopen.Visible = true
			wait(.125)
			db = true
		end
	end)

	script.Parent.reopen.MouseButton1Click:Connect(function()
		if open == false and db == true then
			db = false
			open = true
			game.TweenService:Create(script.Parent.reopen,TweenInfo.new(.1),{Size = UDim2.new(0,0,0,25)}):Play()
			wait(.125)
			script.Parent.reopen.Visible = false
			game.TweenService:Create(script.Parent,TweenInfo.new(.6),{Position = oldPos}):Play()
			wait(.6)
			oldPos = nil
			script.Parent.Active = true
			script.Parent.Draggable = true
			db = true
		end
	end)

	game["Run Service"].RenderStepped:Connect(function()
		if script.Parent.Position.Y.Offset < 50 and open == true then
			script.Parent.Position = UDim2.new(script.Parent.Position.X.Scale,script.Parent.Position.X.Offset,0,50)
		end
	end)

	game.TweenService:Create(script.Parent,TweenInfo.new(1),{Position = UDim2.new(0.5, 0,0, 150)}):Play()
	wait(1)
	script.Parent.Active = true
	script.Parent.Draggable = true
	open = true
	db = true
end
coroutine.wrap(DBGTEGR_fake_script)()

function F_NOCLIPSCRIPT()
	local player = game.Players.LocalPlayer

	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	local uis = game:GetService("UserInputService")
	
	
	uis.InputBegan:Connect(function(inp,chat)
		if chat then return end
		if inp.KeyCode == Enum.KeyCode.RightShift then
			if noclipEnabled then
				noclip = not noclip
				if noclip then
					while noclip and noclipEnabled do
						for _, v in pairs(char:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
								if(not game["Run Service"]:IsStudio()) then game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam end
							end
						end
						wait()
					end
					for _, v in pairs(char:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = true
							if(not game["Run Service"]:IsStudio()) then game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Zoom end
						end
					end
				end
			end
		end
	end)
end

function F_FLYSCRIPT()
	local player = game.Players.LocalPlayer

	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	local cam = workspace.CurrentCamera
	local uis = game:GetService("UserInputService")

	local flightForce
	
	local wPressed = false
	local sPressed = false
	local aPressed = false
	local dPressed = false
	
	local lastJump = 0

	local speed = 100
	
	local function ToggleFlying()
		if flyEnabled == true then
			if DateTime.now().UnixTimestampMillis - lastJump < 400 then
				if not flying then --Is double jumping - Start flying
					lastJump = 0
					flying = true

					char.Animate.Disabled = true
					for a,b in pairs(char:FindFirstChildWhichIsA("Humanoid").Animator:GetPlayingAnimationTracks()) do b:Stop() end
					for a,b in pairs(char:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do b:Stop() end

					if flightForce ~= nil then flightForce:Destroy() end
					flightForce = Instance.new("BodyVelocity", char.PrimaryPart)
					flightForce.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
					flightForce.Velocity = Vector3.new(0,0,0)

					if (wPressed) then flightForce.Velocity += cam.CFrame.LookVector * speed end
					if (sPressed) then flightForce.Velocity += cam.CFrame.LookVector * -speed end
					if (aPressed) then flightForce.Velocity += cam.CFrame.RightVector * -speed end
					if (dPressed) then flightForce.Velocity += cam.CFrame.RightVector * speed end

					while flying do
						hum:ChangeState("PlatformStanding") --This lets us see the move direction in 3 dimensions
						hum:SetStateEnabled('GettingUp',false) --Prevents the character movement from glitching while flying
						
						flightForce.Velocity = Vector3.new(0,0,0)
						
						if (wPressed) then flightForce.Velocity += cam.CFrame.LookVector * speed end
						if (sPressed) then flightForce.Velocity += cam.CFrame.LookVector * -speed end
						if (aPressed) then flightForce.Velocity += cam.CFrame.RightVector * -speed end
						if (dPressed) then flightForce.Velocity += cam.CFrame.RightVector * speed end
						
						wait()
					end

					--Stopped flying
					flightForce:Destroy()
					hum:SetStateEnabled('GettingUp',true)
					char.Animate.Disabled = false
				elseif flying then --Stop flying
					flying = false
				end
			else
				lastJump = DateTime.now().UnixTimestampMillis
			end
		end
	end

	--//Input
	uis.InputBegan:Connect(function(key, chat)
		if chat then return end
		if key.KeyCode == Enum.KeyCode.Space then
			ToggleFlying()
		end
		if key.KeyCode == Enum.KeyCode.W then
			wPressed = true
		elseif key.KeyCode == Enum.KeyCode.S then
			sPressed = true
		elseif key.KeyCode == Enum.KeyCode.A then
			aPressed = true
		elseif key.KeyCode == Enum.KeyCode.D then
			dPressed = true
		end
	end)

	uis.InputEnded:Connect(function(key)	
		if key.KeyCode == Enum.KeyCode.W then
			wPressed = false
		elseif key.KeyCode == Enum.KeyCode.S then
			sPressed = false
		elseif key.KeyCode == Enum.KeyCode.A then
			aPressed = false
		elseif key.KeyCode == Enum.KeyCode.D then
			dPressed = false
		end
	end)
end

flyButton.MouseButton1Click:Connect(function()
	flyEnabled = not flyEnabled
	if flyEnabled == true then flyButton.Text = "On" else flyButton.Text = "Off" end
	if flying == true and flyEnabled == false then
		flying = false
	end
end)

noclipButton.MouseButton1Click:Connect(function()
	noclipEnabled = not noclipEnabled
	if noclipEnabled == true then noclipButton.Text = "On" else noclipButton.Text = "Off" end
	if noclipping == true and noclipEnabled == false then
		noclipping = false
	end
end)

function startGui()
	F_FLYSCRIPT()
	F_NOCLIPSCRIPT()
end

startGui()
