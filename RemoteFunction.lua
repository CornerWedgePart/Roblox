-- client to server, and server to client via remote function


-- Server Script
script.Parent = game.ServerScriptService -- Defines where the script should be located
local RemoteFunction = Instance.new("RemoteFunction") -- Summons and defines a new remote function
RemoteFunction.Name = "TheFunction" -- Gives the remote function a name
RemoteFunction.Parent = game.ReplicatedStorage -- Gives the remote function a parent
RemoteFunction.OnServerInvoke = function(plr) -- Runs a function when the remote function is invoked
    print("Server:", plr.Name, "has contacted the server") -- Says who sent the request
    print("Server: data sent") -- Debug stuff to let us know how the scripts are communicating
  return "OK" -- The data your sending back to the client
end



-- Client Script
script.Parent = game.StarterPlayer.StarterCharacterScripts -- Defines where the script should be located
local RemoteFunction = game.ReplicatedStorage:WaitForChild("TheFunction") -- Defines where to find the function
local player = game.Players.LocalPlayer -- Defines the localplayer as player
local ScreenGui = Instance.new("ScreenGui") -- Defining and Summoning a ScreenGui
local TextButton = Instance.new("TextButton") -- Defining and Summoning a TextButton
local OutputLabel = Instance.new("TextLabel") -- Defining and Summoning a TextLabel
OutputLabel.Size = UDim2.new(0, 200, 0, 50) -- Sets the TextLabels size
OutputLabel.Position = UDim2.new(0, 10, 0, 70) -- Sets the TextLabels position
OutputLabel.Text = "backdata" -- Sets the TextLabels text
OutputLabel.TextScaled = true -- sets The TextLabels Textscaled property to true
TextButton.Size = UDim2.new(0, 100, 0, 50) -- Sets the TextButtons size
TextButton.Position = UDim2.new(0, 10, 0, 10) -- Sets the TextButtons position
TextButton.Text = "Trigger" -- Sets the TextButtons text
TextButton.Name = "ClientButton" -- Sets the TextButtons name
ScreenGui.Name = "ClientUI" -- Sets the ScreenGuis name
ScreenGui.Parent = player.PlayerGui -- Sets the ScreenGuis Parent to the players gui
TextButton.Parent = player.PlayerGui.ClientUI -- Sets the TextButtons Parent to the players gui
OutputLabel.Parent = player.PlayerGui.ClientUI -- Sets the TextLabels Parent to the players gui
TextButton.Activated:Connect(function() -- When the TextButton is clicked runs the code inside the function
    print("Client: Server Invokation requested") -- Debug to let us know whats going on
    local backdata = RemoteFunction:InvokeServer(player) -- Best way to explain this is a normal function but with wrapping to catch the return
    OutputLabel.Text = backdata -- Sets the textlabels text to the return output
    print("Client: data recieved") -- Debug to let us know whats going on
    wait(2) -- a wait before we reset backdata
    backdata = "backdata" -- reseting backdata
    OutputLabel.Text = backdata -- adjusting the associated text 
end)

-- Think of this as like a RemoteEvent, except instead of only Client to Server communication you get two way communication, Client to Server and Server to Client
