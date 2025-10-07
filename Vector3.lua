-- Demo for Vector3 usages
script.Parent = game.ServerScriptService -- Defines the location of this script
local Username = "yourusernamehere"
local Selection = "yourselectionhere" -- Vector3, Vector3 Addition, Vector3 Subtration, Vector3 Multiplication, Vector3 Divison, Vector3, Sizing, Vector3 Orientation, Vector3 Total multiply, Vector3 Total divide, Player Teleport
local X, Y, Z = (0, 0, 0) -- Customizable Values
local Cpart = Instance.new("Part") -- Creates and defines a part
Cpart.Anchored = true -- Anchors the part
Cpart.Parent = game.Workspace -- Sets a parent for the part
Cpart.Position = Vector3.new(100, 10, 100) -- Part starting position
Cpart.Size = Vector3.new(2, 2, 2) -- Part starting Size
wait(5)
if Selection == "Vector3" then
  Cpart.Position = Vector3.new(X, Y, Z) -- will teleport the part to the coordinates given
end
if Selection == "Vector3 Addition" then
  Cpart.Position = Cpart.Position + Vector3.new(X, Y, Z) -- will add from the parts position and move it to the calculated position
end
if Selection == "Vector3 Subtraction" then
  Cpart.Position = Cpart.Position - Vector3.new(X, Y, Z) -- will subtract from the parts position and move it to the calculated position
end
end
if Selection == "Vector3 Multiplication" then
  Cpart.Position = Cpart.Position * Vector3.new(X, Y, Z) -- will multiply from the parts position and move it to the calculated position
end
end
if Selection == "Vector3 Division" then
  Cpart.Position = Cpart.Position / Vector3.new(X, Y, Z) -- will divide from the parts position and move it to the calculated position
end
end
if Selection == "Vector3 Sizing" then -- Sets the parts size equal to the inputted data
  Cpart.Size = Vector3.new(X, Y, Z)
end
if Selection == "Vector3 Orientation" then -- Sets the parts rotation equal to the data inputted
  Cpart.Orientation = Vector3.new(X, Y, Z)
end
if Selection == "Vector3 Total multiply" then -- Multiplys X,Y,Z and multiplys them by variable X
  Cpart.Position = Cpart.Position * X
end
if Selection == "Vector3 Total divide" then -- Divides X,Y,Z and multiplys them by variable X
  Cpart.Position = Cpart.Position / X
end
if Selection == "Player Teleport" then
  local plr = game.Players:WaitForChild(Username) -- finding username in players to define player
  local root = plr.Character:WaitForChild("HumanoidRootPart") -- defines the players humanoidrootpart
  root.Position = Vector3.new(X, Y, Z) -- will teleport the player to the position based on the inputted data
end
