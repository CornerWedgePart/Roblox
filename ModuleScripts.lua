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
print("what color is grass", Grass) -- uses variables defined in the module
print("What is water", Water)
print("What color is the sky", Sky)

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
print(Variable, AnotherVariable)
moduleScript.Polarbear()
