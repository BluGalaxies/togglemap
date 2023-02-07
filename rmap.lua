-- true means the map will be off by default 
bool = true


-- Command /togglemap on/off 
RegisterCommand("togglemap", function(source, args, raw)
	if args[1] == "off" then
        bool = true 
    elseif args[1] == "on" then
        bool = false
    end
end)


-- Loop
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        if bool ~= false then 
            DisplayRadar(false)
        else
            DisplayRadar(true)
        end
    end 
end)


TriggerEvent('chat:addSuggestion', '/togglemap', 'Toggles the map on or off', {
    { name="args", help="On turns the map on, Off turns the map off" },
})
