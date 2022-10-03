loadstring(game:HttpGet("https://pastebin.com/raw/nYtrj9bY"))() -- Not Mine! Full Credits to the Owner, MyWorld#4430

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Character = Player.Character
local FakeCharacter = Character.Model

local Hat = Character:WaitForChild("WDW_FoamFinger")
local Handle = Hat.Handle

local FHat = FakeCharacter:WaitForChild("WDW_FoamFinger")
local FHandle = FHat.Handle

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Mouse = Player:GetMouse()

local Torso = Character:WaitForChild("Torso")
local LeftArm = Character:WaitForChild("Left Arm")

local PointON = false
local ForwardON = false
local ShootON = false
local UrdeadON = false
local CutthroatON = false
local HandsupON = false
local FollowmouseON = false

local active = false

function credits()
	local TimeDATA = os.date("*t")
	
	print("Script Made By: dori#4040, Doriandoll77, moldymayonnaise1")
	print("Reanimation Made by: MyWorld#4430, discord.gg/pYVHtSJmEY")
	print("--------------------------------------------------------")
	print(" ")
	print("Loaded Script Sucessfully... "..TimeDATA.hour..":".. TimeDATA.min)
	print(" ")
end

function align(part, part2, name, r)
	if part:FindFirstChild('AccessoryWeld') then
		part.AccessoryWeld:Remove()
	else
		part:BreakJoints()
	end

	name = name or "Unknown"

	local att0 = Instance.new("Attachment", part)
	att0.Name = 'AlignPos1'
	att0.Position = Vector3.new(0,0,0)	
	local att1 = Instance.new("Attachment", part2)
	att1.Name = 'AlignPos_'..name

	local AP = Instance.new("AlignPosition",part)
	AP.Attachment0 = att0
	AP.Attachment1 = att1
	AP.RigidityEnabled = false
	AP.ReactionForceEnabled = false
	AP.ApplyAtCenterOfMass = true
	AP.MaxForce = 9999999
	AP.MaxVelocity = math.huge
	AP.Responsiveness = r or 1000000000000

	local AO = Instance.new("AlignOrientation", part)
	AO.Attachment0 = att0
	AO.Attachment1 = att1
	AO.ReactionTorqueEnabled = true
	AO.PrimaryAxisOnly = false
	AO.MaxTorque = 9999999
	AO.MaxAngularVelocity = math.huge
	AO.Responsiveness = r or 1000000000000

	return att1
end

function tweento(part, pos, style, direction, del)
	local tween = TweenService:Create(part, TweenInfo.new(
		del,
		style,
		direction, 
		0,                         
		false,                     
		0                          
		),
		{
			Position = pos
		}
	)
	tween:Play()
end

function rtweento(part, pos, style, direction, del)
	local tween = TweenService:Create(part, TweenInfo.new(
		del,
		style,
		direction, 
		0,                         
		false,                     
		0                          
		),
		{
			Rotation = pos
		}
	)
	tween:Play()
end

HatATT = align(Handle, LeftArm, "Hat", 50)
LeftArmATT = align(LeftArm, Torso, "LeftArm")

LeftArmATT.Position = Vector3.new(-1.5, 0, 0)
LeftArmATT.Rotation = Vector3.new(0, 0 ,0)

HatATT.Position = Vector3.new(0, -2.5, 0)
HatATT.Rotation = Vector3.new(-180, 90, 0)

function normalpose()
	tweento(LeftArmATT, Vector3.new(-1.5, 0, 0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
	rtweento(LeftArmATT, Vector3.new(0, 0, 0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)

	tweento(HatATT, Vector3.new(0, -2.5, 0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
	rtweento(HatATT, Vector3.new(-180, 90, 0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
end

function point()
	tweento(LeftArmATT, Vector3.new(-1.5, 0.5, -0.5), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
	rtweento(LeftArmATT, Vector3.new(90, 0, -0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
end

function forward()
	tweento(LeftArmATT, Vector3.new(-1.5, 0.5, -1.3), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
end

function shoot()
	local position = Mouse.Hit.p
	rtweento(LeftArmATT, Vector3.new(125, 0, -0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.1)
	tweento(FHandle, position, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.32)	
	wait(0.1)
	rtweento(LeftArmATT, Vector3.new(90, 0, -0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.1)
	ShootON = false
end

function urdead()
	rtweento(LeftArmATT, Vector3.new(115, 0, 90), Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.2)
	wait(0.2)
	tweento(LeftArmATT, Vector3.new(-4.5, 0.5, -0.5), Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.3)
	UrdeadON = false
	wait(0.2)
	rtweento(LeftArmATT, Vector3.new(90, 0, -0), Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.3)
	tweento(LeftArmATT, Vector3.new(-1.5, 0.5, -0.5), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
end

function cutthroatpose()
	rtweento(LeftArmATT, Vector3.new(90, 1.01778e-13, 70), Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.2)
	tweento(LeftArmATT, Vector3.new(-1, 0.5, -1), Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.2)
end

function cutthroat()
	tweento(LeftArmATT, Vector3.new(-4, 0.5, -1), Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0.2)
	wait(0.2)
	tweento(LeftArmATT, Vector3.new(-1.5, 0.5, -0.5), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
	rtweento(LeftArmATT, Vector3.new(90, 0, -0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
end

function handsup()
	tweento(LeftArmATT, Vector3.new(-1.5, 1.7, 0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.3)
	rtweento(LeftArmATT, Vector3.new(180, 90, 0), Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0.2)
end

UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.X then
		if PointON == true and active ~= true then
			PointON = false
			normalpose()
		elseif PointON == false then
			PointON = true
			point()
		end
	end
	if input.KeyCode == Enum.KeyCode.R then
		if ForwardON == false and PointON == true then
			ForwardON = true
			active = true
			forward()
		end
	end
	if input.KeyCode == Enum.KeyCode.F then
		if UrdeadON == false and PointON == true then
			UrdeadON = true
			active = true
			urdead()
		end
	end
	if input.KeyCode == Enum.KeyCode.T then
		if CutthroatON == false and PointON == true then
			CutthroatON = true
			active = true
			cutthroatpose()
		end
	end
	if input.KeyCode == Enum.KeyCode.C then
		if HandsupON == false and PointON == true then
			HandsupON = true
			active = true
			handsup()
		elseif HandsupON == true and PointON == true then
			HandsupON = false
			active = false
			point()
		end
	end
end)

UserInputService.InputEnded:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.R then
		ForwardON = false
		active = false
		if PointON == true then
			point()
		else
			normalpose()
		end
	end
	if input.KeyCode == Enum.KeyCode.T then
		cutthroat()
		CutthroatON = false
		active = false
	end
end)

Mouse.Button1Down:Connect(function()
	if ShootON == false and active == false then
		ShootON = true
		shoot()
	end
end)

wait(.1)

credits()
