-----------------For support, scripts, and more----------------
-----------------https://discord.gg/XJFNyMy3Bv-----------------
---------------------------------------------------------------
Config = {}

Config.allowedWeapons = {
    `WEAPON_KNIFE`,
    `WEAPON_BOTTLE`,
    `WEAPON_DAGGER`,
    `WEAPON_HATCHET`,
    `WEAPON_MACHETE`,
    `WEAPON_SWITCHBLADE`
}

RegisterNetEvent('wasabi_tireslash:notify')
AddEventHandler('wasabi_tireslash:notify', function(message)	
	
-- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    ShowNotification(message)

end)

Language = {
    ['no_weapon'] = 'You need to be holding something sharp to do this!',
    ['car_slashed'] = 'Someone slashed your tire!',
    ['already_slashed'] = 'This tire has already been flattened!'
}