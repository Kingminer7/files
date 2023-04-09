local flyEnabled = false

function F_FLYSCRIPT()
	local player = game.Players.LocalPlayer

	local char = player.Character or player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")

	local cam = workspace.CurrentCamera
	local uis = game:GetService("UserInputService")

	local flightForce

	local speed = 100

	local flying = false
	local function ToggleFlying()
		if flyEnabled == true then
			if not flying and hum.FloorMaterial == Enum.Material.Air then --Is double jumping - Start flying
				flying = true

				char.Animate.Disabled = true
				for a,b in pairs(char:FindFirstChildWhichIsA("Humanoid").Animator:GetPlayingAnimationTracks()) do b:Stop() end
				for a,b in pairs(char:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do b:Stop() end

				if flightForce ~= nil then flightForce:Destroy() end
				flightForce = Instance.new("BodyVelocity", char.PrimaryPart)
				flightForce.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				flightForce.Velocity = hum.MoveDirection*speed

				while flying do
					hum:ChangeState("PlatformStanding") --This lets us see the move direction in 3 dimensions
					hum:SetStateEnabled('GettingUp',false) --Prevents the character movement from glitching while flying

					flightForce.Velocity = hum.MoveDirection*speed
					wait()
				end

				--Stopped flying
				flightForce:Destroy()
				hum:SetStateEnabled('GettingUp',true)
				char.Animate.Disabled = false
			elseif flying then --Stop flying
				flying = false
			end
		end
	end

	--//Input
	uis.InputBegan:Connect(function(key, processed)
		if key.KeyCode == Enum.KeyCode.Space then
			ToggleFlying()
		end
	end)
end

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

--Properties:

gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer.PlayerGui

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

function startGui()
	F_FLYSCRIPT()
end

startGui()
