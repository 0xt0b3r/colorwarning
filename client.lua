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
	TriggerEvent("chat:addMessage", {
		args = { "^1Uh Oh! It appears you have the following ^3" ..#colorsFound.. " ^1colors in your name:" }
	})
	for key, color in pairs(colorsFound) do
		if color == "~r~" then
			TriggerEvent("chat:addMessage", {
				color = { 255, 68, 68 },
				args = { color }
			})
		elseif color == "~b~" then
			TriggerEvent("chat:addMessage", {
				color = { 58, 135, 212 },
				args = { color }
			})
		elseif color == "~g~" then
			TriggerEvent("chat:addMessage", {
				color = { 65, 174, 65 },
				args = { color }
			})
		elseif color == "~y~" then
			TriggerEvent("chat:addMessage", {
				color = { 238, 238, 26 },
				args = { color }
			})
		elseif color == "~o~" then
			TriggerEvent("chat:addMessage", {
				color = { 238, 167, 26 },
				args = { color }
			})
		elseif color == "~p~" then
			TriggerEvent("chat:addMessage", {
				color = { 179, 49, 199 },
				args = { color }
			})
		elseif color == "~c~" then
			TriggerEvent("chat:addMessage", {
				color = { 156, 155, 156 },
				args = { color }
			})
		elseif color == "~m~" then
			TriggerEvent("chat:addMessage", {
				color = { 85, 84, 85 },
				args = { color }
			})
		elseif color == "~u~" then
			TriggerEvent("chat:addMessage", {
				color = { 0, 0, 0 },
				args = { color }
			})
		end
	end
	TriggerEvent("chat:addMessage", {
		args = { "^1We dont allow colored names on our server!" }
	})
	TriggerEvent("chat:addMessage", {
		args = { "^3We kindly ask if you would remove them before playing with us!" }
	})
end)
