-- Coroutines example calculator

local X, Y = 0, 0 -- Gives X and Y a value

local add = coroutine.create(function() -- Coroutine named add
    while true do -- loop
      print("Adder:", X + Y ) -- adds X and Y
      task.wait(0.1) -- you can never be to catious
      coroutine.yield() -- pauses the couroutine 
    end
  end)

local subtract = coroutine.create(function() -- Coroutine named subtract
    while true do -- loop
      print("Subtractor:", x - y )  -- subtracts Y from X
      task.wait(0.1) -- you can never be to catious
      coroutine.yield() -- pauses the couroutine 
    end
  end)

local multiply = coroutine.create(function() -- Coroutine named multiply
    while true do
      print("Multiplier:", X * Y )  -- multiply X and Y
      task.wait(0.1) -- you can never be to catious
      coroutine.yeild() -- pauses the couroutine 
    end
  end)

local divide = coroutine.create(function() -- Coroutine named Divide
    while true do 
      print("Divider:", X / Y)  -- divide X by Y
      task.wait(0.1) -- you can never be to catious
      coroutine.yield() -- pauses the couroutine 
    end
  end)

game.Players.PlayerAdded:Connect(function(player) -- Passes in the player
    player.Chatted:Connect(function(msg) --Waits and passes player message to local chat
        local chat = string.split(msg," ") -- seperates the text msg using a space in " " into strings
        X = tonumber(chat[1]) -- sets X equal to the first number
        Y = tonumber(chat[2]) -- sets Y equal to the second number
        if X == nil then  -- if X nil or not a number then throw error and debug
          warn("DEBUG:", X, Y ) -- shows the values of both
          error("Invalid args") -- throws an era
        end
        if Y == nil then --if Y nil or not a number then throw error and debug
          warn("DEBUG:", X, Y ) -- shows the values of both
           error("Invalid args") -- throws an era
        end
        warn("Data given:", X, Y ) -- prints the data inputted via chat msg
        coroutine.resume(add) -- start the adder
        coroutine.resume(subract) -- start the subtractor
        coroutine.resume(multiply) -- start the multiplier
        coroutine.resume(divide) -- start the divider
    end)
end)

-- Basically coroutines are like side scripts you can run at the same time(not the main thread), very useful.
