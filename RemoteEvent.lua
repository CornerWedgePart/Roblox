-- Simple client to server communication

--Server (Script)
script.Parent = game.ServerScriptService -- Defines where this script should be (ServerScriptService)

local RemoteEvent = Instance.new("RemoteEvent") -- Defining a RemoteEvent and using Instance.new to summon it to nil with little to no properties
RemoteEvent.name = "Connector" -- Sets the name of the RemoteEvent
RemoteEvent.Parent = game.ReplicatedStorage -- Sets the parent of the RemoteEvent
RemoteEvent.OnServerEvent:Connect(function(player) -- Waits for server event, one it does it runs the function and passes in the variable player
    print("Server triggered by:", player.Name) -- Sends a message on the server side including a variable passed in.
end)


--Client (Local Script)

script.Parent = game.StarterPlayerScripts -- Defines where this script should be (StarterPlayerScripts)

local player = game.Players.LocalPlayer -- Defining the player to a variable
local RemoteEvent = game.ReplicatedStorage:Waitforchild("Connector") -- Defining RemoteEvent and waiting for its to exist as we summoned it in the server script
local ScreenGui = Instance.new("ScreenGui") -- Defining and Summoning a ScreenGui
local TextButton = Instance.new("TextButton") -- Defining and Summoning a TextButton
TextButton.Size = Udim2.new(0, 100, 0, 50) -- Sets the TextButtons size
TextButton.Position = Udim2.new(0, 10, 0, 10) -- Sets the TextButtons position
TextButton.Text = "Trigger" -- Sets the TextButtons text
TextButton.Name = "ClientButton" -- Sets the TextButtons name
ScreenGui.Name = "ClientUI" -- Sets the ScreenGuis name
ScreenGui.Parent = player.PlayerGui -- Sets the ScreenGuis Parent to the players gui
TextButton.Parent = player.PlayerGui.ClientUI -- Sets the TextButtons Parent to the players gui
TextButton.Activated:Connect(function() -- When the TextButton is clicked runs the code inside the function
    RemoteEvent:FireServer(player) -- Sends a signal to the RemoteEvent and passes in the player
    print("Triggering Server") -- sends a message on the client side
end)

-- Client has power to an extent, it can modify things within its enviroment, but it cannot interfere with any other clients unless given a door to do so.
-- Server has full control over the game and the clients within the game, however it lacks certain capabilities that exploits and normal lua has for safety(RIP LOADSTRING).
