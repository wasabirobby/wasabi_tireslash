-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

ShowNotification = function(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0,1)
end


GetClosestVehicleToPlayer = function()
	local plyPed = PlayerPedId()
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	local radius = 3.0
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 10, plyPed, 7)
	local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
	return vehicle
end

CanUseWeapon = function(allowedWeapons)
	local plyPed = PlayerPedId()
	local plyCurrentWeapon = GetSelectedPedWeapon(plyPed)
	for i = 1, #allowedWeapons do
		if allowedWeapons[i] == plyCurrentWeapon then
			return true
		end
	end
	return false
end

GetDriverOfVehicle = function(vehicle)
	local driver = GetPedInVehicleSeat(vehicle, -1)
    if driver then
        if IsPedAPlayer(driver) then
            local plyId = NetworkGetPlayerIndexFromPed(driver)
            if NetworkGetPlayerIndexFromPed(driver) > 0 then
                return plyId
            else
                return -1
            end
        else
            return -1
        end
    else
        return -1
	end
end

GetClosestVehicleTire = function(vehicle)
	local tireBones = {"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}
	local tireIndex = {
		["wheel_lf"] = 0,
		["wheel_rf"] = 1,
		["wheel_lm1"] = 2,
		["wheel_rm1"] = 3,
		["wheel_lm2"] = 45,
		["wheel_rm2"] = 47,
		["wheel_lm3"] = 46,
		["wheel_rm3"] = 48,
		["wheel_lr"] = 4,
		["wheel_rr"] = 5,
	}
	local plyPed = PlayerPedId()
	local plyPos = GetEntityCoords(plyPed, false)
	local minDistance = 1.0
	local closestTire = nil
	
	for a = 1, #tireBones do
		local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tireBones[a]))
		local distance = #(plyPos - vector3(bonePos.x, bonePos.y, bonePos.z))

		if closestTire == nil then
			if distance <= minDistance then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		else
			if distance < closestTire.boneDist then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		end
	end

	return closestTire
end
