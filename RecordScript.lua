local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

---
local onRecording = false
---

---
local FRAMES = {}
---

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "RORecord(CHEAT)"


local record_button2 = Instance.new("TextButton", screenGui) local uiCorner = Instance.new("UICorner", record_button2)
record_button2.Name = "RecordButtonREAL"
record_button2.Position = UDim2.new(0.303, 0,0, 0)
record_button2.Size = UDim2.new(0.125, 0,0.08, 0)
record_button2.TextColor = BrickColor.new("Really red")
record_button2.Text = "Record"
record_button2.TextScaled = true
record_button2.Style = Enum.ButtonStyle.RobloxButton

local play_button = Instance.new("TextButton", screenGui) local uiCorner2 = Instance.new("UICorner", play_button)
play_button.Name = "Play_Button"
play_button.Position = UDim2.new(0.572, 0,0, 0)
play_button.Size = UDim2.new(0.125, 0,0.08, 0)
play_button.TextColor = BrickColor.new("Lime green")
play_button.Text = "Play"
play_button.TextScaled = true
play_button.Style = Enum.ButtonStyle.RobloxButton

record_button2.MouseButton1Click:Connect(function()
	if onRecording then
		onRecording = false
		record_button2.Text = "Record"
	else
		onRecording = true
		record_button2.Text = "Recording"
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if onRecording then
		table.insert(FRAMES, character:FindFirstChild("HumanoidRootPart").CFrame)
	end
end)

play_button.MouseButton1Click:Connect(function()
	for i = #FRAMES, 1, -2 do
		task.wait()
		character:FindFirstChild("HumanoidRootPart").CFrame = FRAMES[i]
	end
	table.clear(FRAMES)
end)
