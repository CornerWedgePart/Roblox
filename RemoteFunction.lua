-- Server Script
local RemoteFunction = Instance.new("RemoteFunction")
RemoteFunction.Name = "TheFunction"
RemoteFunction.Parent = game.ReplicatedStorage
RemoteFunction.OnServerInvoke = function(plr)
    local Isworking = true
  return Isworking
end



-- Client Script
local RemoteFunction = game:WaitforChild("TheFunction")
local ScreenGui = Instance.new("ScreenGui") -- Defining and Summoning a ScreenGui
local TextButton = Instance.new("TextButton") -- Defining and Summoning a TextButton
local OutputLabel = Instance.new("TextLabel") -- Defining and Summoning a TextLabel
OutputLabel.Size = UDim2.new(0, 200, 0, 50)
OutputLabel.Position = UDim2.new(0, 10, 0, 70)
OutputLabel.Text = "Output will appear here"
OutputLabel.TextScaled = true
TextButton.Size = UDim2.new(0, 100, 0, 50) -- Sets the TextButtons size
TextButton.Position = UDim2.new(0, 10, 0, 10) -- Sets the TextButtons position
TextButton.Text = "Trigger" -- Sets the TextButtons text
TextButton.Name = "ClientButton" -- Sets the TextButtons name
ScreenGui.Name = "ClientUI" -- Sets the ScreenGuis name
ScreenGui.Parent = player.PlayerGui -- Sets the ScreenGuis Parent to the players gui
TextButton.Parent = player.PlayerGui.ClientUI -- Sets the TextButtons Parent to the players gui
OutputLabel.Parent = ScreenGui
TextButton.Activated:Connect(function() -- When the TextButton is clicked runs the code inside the function
local isworking = RemoteFunction:InvokeServer()
    print(isworking)
  end)
