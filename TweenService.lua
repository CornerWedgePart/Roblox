-- Simple plug and play local script (StarterGUI) demonstrating the use of TweenService

local TweenService = game:GetService("TweenService") -- gets the tweenservice to use for the tween
local TweeningObject = Instance.new("Frame") -- imagine this as your object you want to tween you could reference it easier by like ex: game.Workspace.MyPart, but for this demo im using a gui frame

local player = game.Players.LocalPlayer -- ignore this
local Tweengui = Instance.new("ScreenGui") -- ignore this
TweeningObject.Size = UDim2.new(0, 100, 0, 100) -- ignore this
TweeningObject.Position = UDim2.new(0.420, 0 ,0.45, 0) --ignore this
TweeningObject.Transparency = 1 -- ignore this
TweeningObject.Parent = Tweengui -- ignore this
Tweengui.Parent = player.PlayerGui -- ignore this

local TweenInfo = TweenInfo.new(2, Enum.EasingStyle.Bounce) -- 5 is the duration of the tween, and Enum.EasingStyle.Bounce is the animation style, more styles include: Linear, Sine, Back, Quad, Quart

local Play = coroutine.create(function() -- ignore this
    TweeningObject.Transparency = 0 -- ignore this
    while true do -- ignore this
        local goal = { -- table the goals/changes you want to happen in the tween
            -- Example of more properties you could add ---> Size = UDim2.new(0, 65, 0, 65) 
            Position = UDim2.new(0.420, 0, 0.155, 0) -- Position i want my TweenObject to go to
        }

        local tween = TweenService:Create(TweeningObject, TweenInfo, goal) -- Creates the tween with the information we wanna give it defined by our variables
        tween:Play() -- tells the tween to play, to pause just do tween:Pause()
        tween.Completed:Wait() -- waits for the tween to be completed before continuing

        local newgoal = { -- another table with different goals we want to happen in the tween
            Position = UDim2.new(0.420, 0 ,0.815 , 0)
        }

        tween = TweenService:Create(TweeningObject, TweenInfo, newgoal) -- Creates the tween with the information we wanna give it defined by our variables
        tween:Play() -- tells the tween to play
        tween.Completed:Wait() -- wait for the tween to be completed before continuing the loop
    end
end)

wait(5) -- waits 5 seconds before starting the animation
coroutine.resume(Play) -- ignore this (starts the animation)
  
