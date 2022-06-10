-----------------For support, scripts, and more----------------
----------------- https://discord.gg/XJFNyMy3Bv ---------------
---------------------------------------------------------------
RegisterServerEvent('wasabi_tireslash:sync')
AddEventHandler('wasabi_tireslash:sync', function(id, tireIndex)
	TriggerClientEvent('wasabi_tireslash:sync', id, tireIndex)
end)
