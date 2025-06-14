-- Sense Hub Loader
-- by Veylo

if getgenv().SenseHubLoader then
    warn("Sense Hub Loader is already executed")
    return
end
getgenv().SenseHubLoader = true

-- Game ID for Blade Ball
local BLADE_BALL_GAME_ID = 13772394625

-- Load Fluent UI Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Create Loader Window
local Window = Fluent:CreateWindow({
    Title = "Sense Hub",
    SubTitle = "by Veylo",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl,
    CanResize = false,
    ScrollSpeed = 30,
    ScrollingEnabled = false
})

-- Create Main Tab
local MainTab = Window:AddTab({ Title = "Scripts", Icon = "code", ScrollingEnabled = false })

-- Add some spacing
MainTab:AddParagraph({
    Title = "Welcome to Sense Hub",
    Content = "Select a script to execute:"
})

-- FF2 Button
local FF2Button = MainTab:AddButton({
    Title = "FF2",
    Description = "Executes the FF2 script",
    Callback = function()
        -- Execute FF2 script
        Fluent:Notify({
            Title = "Loading FF2",
            Content = "FF2 script is being executed...",
            Duration = 3
        })

        -- Load and execute the FF2 script
        pcall(function()
            if readfile and isfile("FF2.lua") then
                loadstring(readfile("FF2.lua"))()
            else
                -- Fallback to HTTP if local file not found
                loadstring(game:HttpGet("https://raw.githubusercontent.com/RealVeylo/ff2/refs/heads/main/lua"))()
            end
        end)
    end
})

-- Blade Ball Button
local BladeBallButton = MainTab:AddButton({
    Title = "Blade Ball",
    Description = "Executes the Blade Ball script",
    Callback = function()
        -- Check if user is in the correct game
        if game.PlaceId ~= BLADE_BALL_GAME_ID then
            warn("You are not in Blade Ball")
            Fluent:Notify({
                Title = "Wrong Game",
                Content = "You are not in the Blade Ball game!",
                Duration = 5
            })
            return
        end

        -- Execute Blade Ball script
        Fluent:Notify({
            Title = "Loading Blade Ball",
            Content = "Blade Ball script is being executed...",
            Duration = 3
        })

        -- Load and execute the Blade Ball script
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/RealVeylo/bb/refs/heads/main/lua"))()
        end)
    end
})

-- Add info section
MainTab:AddParagraph({
    Title = "Information",
    Content = "• Each game only executes in designated game!"
})

-- Select the main tab by default
Window:SelectTab(1)

-- Notification that loader is ready
Fluent:Notify({
    Title = "Sense Hub",
    Content = "Loader is ready!",
    Duration = 3
})
