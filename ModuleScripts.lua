-- Demonstration of module scrripts

--Basic modulescript(Replicated Storage)
local module {
  -- Inside of here is a table, pay attention to syntax (,)
  Grass = green,
  Water = wet,
  Sky = blue
}

return module 

-- Calling this basic module(any script, client or server)
local Modulescript = require(game.ReplicatedStorage.ModuleScript) -- uses require() to get the contents
print("what color is grass", Modulescript.Grass) -- uses variables defined in the module
print("What is water", Modulescript.Water)
print("What color is the sky", Modulescript.Sky)
Modulescript.Grass = "not green" -- example of modification of the module you could use
Modulescript.Water = "not wet"
Modulescript.Sky = "not blue"


-- How to add functions to module scripts
local module {
  Variable = "Something",
  AnotherVariable = "SomethingElse"
}

function module.Polarbear()
  print("this is how to do a function")
end

return module

-- Calling script
local modulescript = require(game.ReplicatedStorage.ModuleScript)
print(modulescript.Variable, modulescript.AnotherVariable)
moduleScript.Polarbear()
