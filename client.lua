colors = {
	"~r~",
	"~b~", 
	"~g~",
	"~y~",
	"~p~", 
	"~o~", 
	"~c~", 
	"~m~", 
	"~u~"
}

colorsFound = {}

RegisterNetEvent("ColorsFound")
AddEventHandler("ColorsFound", function(source)
	TriggerEvent("DisplayMessage", source)
end)

RegisterNetEvent("SearchName")
AddEventHandler("SearchName", function(source)
	local source = source 
	local name = GetPlayerName(source)

	for key, color in pairs(colors) do
		start, finish = string.find(name, color)

		if start ~= nil and finish ~= nil then
			table.insert(colorsFound, color)
		end
	end

	if not rawequal(next(colorsFound), nil) then
    	TriggerEvent("ColorsFound", source)
	end
end)

AddEventHandler("onClientMapStart", function()
	Wait(2000)
	if Config.joinAlerts then
		TriggerEvent("SearchName", source)
	end
end)

RegisterNetEvent("DisplayMessage")
AddEventHandler("DisplayMessage", function(source)
	TriggerEvent("chatMessage", "^1Uh Oh! It appears you have the following ^3" ..#colorsFound.. " ^1colors in your name:")
	for key, color in pairs(colorsFound) do
		if color == "~r~" then
			TriggerEvent("chatMessage", color, { 255, 68, 68 })
		elseif color == "~b~" then
			TriggerEvent("chatMessage", color, { 58, 135, 212 })
		elseif color == "~g~" then
			TriggerEvent("chatMessage", color, { 65, 174, 65 })
		elseif color == "~y~" then
			TriggerEvent("chatMessage", color, { 238, 238, 26 })
		elseif color == "~o~" then
			TriggerEvent("chatMessage", color, { 238, 167, 26 })
		elseif color == "~p~" then
			TriggerEvent("chatMessage", color, { 179, 49, 199 })
		elseif color == "~c~" then
			TriggerEvent("chatMessage", color, { 156, 155, 156 })
		elseif color == "~m~" then
			TriggerEvent("chatMessage", color, { 85, 84, 85 })
		elseif color == "~u~" then
			TriggerEvent("chatMessage", color, { 0, 0, 0 })
		end
	end
	TriggerEvent("chatMessage", "^1We dont allow colored names on our server!")
	TriggerEvent("chatMessage", "^3We kindly ask if you would remove them before playing with us!")
end)
