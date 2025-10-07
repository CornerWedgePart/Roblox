-- Server Script
local RemoteFunction = Instance.new("RemoteFunction")
RemoteFunction.Name = TheFunction
RemoteFunction.Parent = game.ReplicatedStorage
TheFunction.OnServerInvokation



-- Client Script





OutputLabel.Size = UDim2.new(0, 200, 0, 50)
OutputLabel.Position = UDim2.new(0, 10, 0, 70)
OutputLabel.Text = "Output will appear here"
OutputLabel.TextScaled = true
OutputLabel.Parent = ScreenGui
