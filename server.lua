
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

function CleanName(player)
	local name = GetPlayerName(player)
	local newName = name

	for key, color in pairs(colors) do
		start, finish = string.find(newName, color)

		if start ~= nil and finish ~= nil then
			newName = string.gsub(newName, '%'..color, '')
		end
	end
	return newName
end

