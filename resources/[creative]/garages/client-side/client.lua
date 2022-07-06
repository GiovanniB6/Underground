-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("garages",cRP)
vSERVER = Tunnel.getInterface("garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local searchBlip = nil
local spawnSelected = {}
local vehHotwired = false
local anim = "machinic_loop_mechandplayer"
local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local garageLocates = {
	["1"] = { x = 55.44, y = -876.17, z = 30.67,
		["1"] = { 60.44,-866.47,30.23,340.16 },
		["2"] = { 57.26,-865.35,30.25,340.16 },
		["3"] = { 54.03,-864.21,30.25,340.16 },
		["4"] = { 50.73,-863.01,30.26,340.16 },
		["5"] = { 60.52,-866.53,30.14,340.16 },
		["6"] = { 50.73,-873.28,30.11,158.75 },
		["7"] = { 47.36,-872.07,30.13,158.75 },
		["8"] = { 44.15,-870.9,30.13,158.75 }
	},
	["2"] = { x = 317.69, y = 2623.28, z = 44.47,
		["1"] = { 336.89,2619.88,44.15,19.85 },
		["2"] = { 341.94,2622.62,44.16,28.35 },
		["3"] = { 348.98,2624.48,44.15,25.52 },
		["4"] = { 354.41,2627.21,44.15,28.35 }
	},
	["3"] = { x = -136.8, y = 6356.84, z = 31.49,
		["1"] = { -133.72,6349.01,31.16,42.52 },
		["2"] = { -136.1,6346.53,31.16,42.52 },
		["3"] = { -149.96,6362.31,31.14,226.78 },
		["4"] = { -152.42,6359.54,31.14,226.78 },
		["5"] = { -154.81,6356.95,31.14,226.78 }
	},
	["4"] = { x = 1706.97, y = 4791.86, z = 41.97,
		["1"] = { 1709.2,4799.13,41.48,0.0 },
		["2"] = { 1712.5,4799.48,41.47,0.0 }
	},
	["5"] = { x = 145.81, y = -1058.8, z = 30.18,
		["1"] = { 141.09,-1058.3,28.58,161.58 }
	},
	["6"] = { x = -1187.56, y = -1575.37, z = 4.35,
		["1"] = { -1188.48,-1572.54,4.33,306.15 }
	},
	["7"] = { x = -773.39, y = 5598.07, z = 33.6,
		["1"] = { -773.09,5594.93,32.87,215.44 }
	},
	["8"] = { x = -294.19, y = -987.01, z = 31.07,
		["1"] = { -297.7,-990.39,30.73,343.0 },
		["2"] = { -301.25,-989.03,30.73,340.16 },
		["3"] = { -304.7,-987.75,30.73,343.0 },
		["4"] = { -308.13,-986.46,30.73,340.16 },
		["5"] = { -311.51,-985.25,30.73,340.16 },
		["6"] = { -315.17,-983.97,30.73,343.0 }
	},
	["9"] = { x = 1141.53, y = 2659.84, z = 38.16,
		["1"] = { 1137.13,2667.64,37.68,0.0 },
		["2"] = { 1137.26,2659.89,37.66,0.0 },
		["3"] = { 1137.43,2651.99,37.64,0.0 }
	},
	["10"] = { x = -1177.62, y = -891.05, z = 13.78,
		["1"] = { -1165.41,-887.92,13.78,119.06 },
		["2"] = { -1163.63,-891.16,13.78,121.89 }
	},
	["11"] = { x = 795.96, y = -721.37, z = 28.07,
		["1"] = { 800.66,-722.66,27.62,133.23 },
		["2"] = { 803.23,-724.82,27.41,130.4 },	
		["3"] = { 805.61,-727.26,27.28,130.4 },
		["4"] = { 807.84,-729.7,27.25,133.23},
		["5"] = { 810.04,-732.36,27.25,130.4 }
	},
	["12"] = { x = 1577.52, y = 6456.28, z = 25.31,
		["1"] = { 1571.93,6457.69,24.36,65.2 },
		["2"] = { 1572.94,6460.92,24.43,68.04 },	
		["3"] = { 1574.38,6464.08,24.48,68.04 }
	},
	["13"] = { x = 795.47, y = -822.48, z = 26.17,
		["1"] = { 803.39,-820.57,26.27,272.13 },
	},
	["14"] = { x = -1476.1, y = -1022.61, z = 6.25,
		["1"] = { -1469.78,-1023.7,5.37,235.28 },
		["2"] = { -1471.68,-1025.48,5.43,235.28 },
		["3"] = { -1473.07,-1027.3,5.41,238.12 },
		["4"] = { -1474.48,-1029.13,5.41,226.78 }
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEMODS
-----------------------------------------------------------------------------------------------------------------------------------------
function vehicleMods(veh,vehCustom)
	if vehCustom then
		SetVehicleModKit(veh,0)

		if vehCustom["wheeltype"] ~= nil then
			SetVehicleWheelType(veh,vehCustom["wheeltype"])
		end

		if vehCustom["mods"] then
			for i = 0,16 do
				if vehCustom["mods"][tostring(i)] ~= nil then
					SetVehicleMod(veh,i,vehCustom["mods"][tostring(i)])
				end
			end

			for i = 17,22 do
				if vehCustom["mods"][tostring(i)] ~= nil then
					ToggleVehicleMod(veh,i,vehCustom["mods"][tostring(i)])
				end
			end

			for i = 23,24 do
				if vehCustom["mods"][tostring(i)] ~= nil then
					if vehCustom["var"] == nil then
						vehCustom["var"] = {}
						vehCustom["var"][tostring(i)] = 0
					end

					SetVehicleMod(veh,i,vehCustom["mods"][tostring(i)],vehCustom["var"][tostring(i)])
				end
			end

			for i = 25,48 do
				if vehCustom["mods"][tostring(i)] ~= nil then
					SetVehicleMod(veh,i,vehCustom["mods"][tostring(i)])
				end
			end
		end

		if vehCustom["neon"] ~= nil then
			for i = 0,3 do
				SetVehicleNeonLightEnabled(veh,i,vehCustom["neon"][tostring(i)])
			end
		end

		if vehCustom["extras"] ~= nil then
			for i = 1,12 do
				local onoff = tonumber(vehCustom["extras"][i])
				if onoff == 1 then
					SetVehicleExtra(veh,i,0)
				else
					SetVehicleExtra(veh,i,1)
				end
			end
		end

		if vehCustom["liverys"] ~= nil and vehCustom["liverys"] ~= 24  then
			SetVehicleLivery(veh,vehCustom["liverys"])
		end

		if vehCustom["plateIndex"] ~= nil and vehCustom["plateIndex"] ~= 4 then
			SetVehicleNumberPlateTextIndex(veh,vehCustom["plateIndex"])
		end

		SetVehicleXenonLightsColour(veh,vehCustom["xenonColor"])
		SetVehicleColours(veh,vehCustom["colors"][1],vehCustom["colors"][2])
		SetVehicleExtraColours(veh,vehCustom["extracolors"][1],vehCustom["extracolors"][2])
		SetVehicleNeonLightsColour(veh,vehCustom["lights"][1],vehCustom["lights"][2],vehCustom["lights"][3])
		SetVehicleTyreSmokeColor(veh,vehCustom["smokecolor"][1],vehCustom["smokecolor"][2],vehCustom["smokecolor"][3])

		if vehCustom["tint"] ~= nil then
			SetVehicleWindowTint(veh,vehCustom["tint"])
		end

		if vehCustom["dashColour"] ~= nil then
			SetVehicleInteriorColour(veh,vehCustom["dashColour"])
		end

		if vehCustom["interColour"] ~= nil then
			SetVehicleDashboardColour(veh,vehCustom["interColour"])
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.spawnPosition(openGarage)
	local checkSlot = 0
	local checkPos = nil

	repeat
		checkSlot = checkSlot + 1

		if garageLocates[openGarage][tostring(checkSlot)] ~= nil then
			local _,groundZ = GetGroundZAndNormalFor_3dCoord(garageLocates[openGarage][tostring(checkSlot)][1],garageLocates[openGarage][tostring(checkSlot)][2],garageLocates[openGarage][tostring(checkSlot)][3])
			spawnSelected = { garageLocates[openGarage][tostring(checkSlot)][1],garageLocates[openGarage][tostring(checkSlot)][2],groundZ,garageLocates[openGarage][tostring(checkSlot)][4] }
			checkPos = GetClosestVehicle(spawnSelected[1],spawnSelected[2],spawnSelected[3],2.501,0,71)
		end
	until not DoesEntityExist(checkPos) or garageLocates[openGarage][tostring(checkSlot)] == nil

	if garageLocates[openGarage][tostring(checkSlot)] == nil then
		TriggerEvent("Notify","amarelo","Vagas estão ocupadas.",5000)
		return false
	end

	return spawnSelected
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.createVehicle(vehModel,vehNet,vehEngine,vehCustom,vehWindows,vehTyres)
	if NetworkDoesNetworkIdExist(vehNet) then
		local Vehicle = NetToEnt(vehNet)
		if DoesEntityExist(Vehicle) then

			if vehCustom ~= nil then
				local vehMods = json.decode(vehCustom)
				vehicleMods(Vehicle,vehMods)
			end

			SetVehicleEngineHealth(Vehicle,vehEngine + 0.0)

			if vehWindows then
				local vehWindows = json.decode(vehWindows)
				if vehWindows ~= nil then
					for k,v in pairs(vehWindows) do
						if not v then
							RemoveVehicleWindow(Vehicle,parseInt(k))
						end
					end
				end
			end

			if vehTyres then
				local vehTyres = json.decode(vehTyres)
				if vehTyres ~= nil then
					for k,Burst in pairs(vehTyres) do
						if Burst then
							SetVehicleTyreBurst(Vehicle,parseInt(k),true,1000.0)
						end
					end
				end
			end

			SetModelAsNoLongerNeeded(vehModel)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:Delete")
AddEventHandler("garages:Delete",function(Vehicle)
	if Vehicle == nil or Vehicle == "" then
		Vehicle = vRP.nearVehicle(15)
	end

	if IsEntityAVehicle(Vehicle) then
		local Tyres = {}
		local Doors = {}
		local Windows = {}

		for i = 0,5 do
			Doors[i] = IsVehicleDoorDamaged(Vehicle,i)
		end

		for i = 0,5 do
			Windows[i] = IsVehicleWindowIntact(Vehicle,i)
		end

		for i = 0,7 do
			local Status = false

			if GetTyreHealth(Vehicle,i) ~= 1000.0 then
				Status = true
			end

			Tyres[i] = Status
		end

		vSERVER.tryDelete(VehToNet(Vehicle),GetVehicleEngineHealth(Vehicle),GetVehicleBodyHealth(Vehicle),GetVehicleFuelLevel(Vehicle),Doors,Windows,Tyres,GetVehicleNumberPlateText(Vehicle))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHBLIP
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.searchBlip(vehCoords)
	if DoesBlipExist(searchBlip) then
		RemoveBlip(searchBlip)
		searchBlip = nil
	end

	searchBlip = AddBlipForCoord(vehCoords["x"],vehCoords["y"],vehCoords["z"])
	SetBlipSprite(searchBlip,225)
	SetBlipColour(searchBlip,2)
	SetBlipScale(searchBlip,0.6)
	SetBlipAsShortRange(searchBlip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Veículo")
	EndTextCommandSetBlipName(searchBlip)

	SetTimeout(30000,function()
		RemoveBlip(searchBlip)
		searchBlip = nil
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTANIMHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.startAnimHotwired()
	vehHotwired = true

	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(1)
	end

	TaskPlayAnim(PlayerPedId(),animDict,anim,3.0,3.0,-1,49,5.0,0,0,0)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPANIMHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.stopAnimHotwired(vehicle)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(1)
	end

	vehHotwired = false
	StopAnimTask(PlayerPedId(),animDict,anim,2.0)

	if vehicle ~= nil then
		local netVeh = VehToNet(vehicle)

		SetNetworkIdCanMigrate(netVeh,true)

		SetEntityAsMissionEntity(vehicle,true,false)
		SetVehicleHasBeenOwnedByPlayer(vehicle,true)
		SetVehicleNeedsToBeHotwired(vehicle,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateHotwired(status)
	vehHotwired = status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOPHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsUsing(ped)
			local platext = GetVehicleNumberPlateText(vehicle)
			if GetPedInVehicleSeat(vehicle,-1) == ped and not GlobalState["vehPlates"][platext] then
				SetVehicleEngineOn(vehicle,false,true,true)
				DisablePlayerFiring(ped,true)
				timeDistance = 1
			end

			if vehHotwired and vehicle then
				DisableControlAction(1,75,true)
				DisableControlAction(1,20,true)
				timeDistance = 1
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:UPDATELOCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:updateLocs")
AddEventHandler("garages:updateLocs",function(homeName,homeInfos)
	garageLocates[homeName] = homeInfos
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:UPDATEREMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:updateRemove")
AddEventHandler("garages:updateRemove",function(homeName,homeInfos)
	if garageLocates[homeName] then
		garageLocates[homeName] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:ALLLOCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:allLocs")
AddEventHandler("garages:allLocs",function(garageTable)
	for k,v in pairs(garageTable) do
		garageLocates[k] = v
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:IMPOUND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:Impound")
AddEventHandler("garages:Impound",function()
	if not menuOpen then
		local Impound = vSERVER.Impound()
		if parseInt(#Impound) > 0 then
			for k,v in pairs(Impound) do
				exports["dynamic"]:AddButton(v["name"],"Clique para iniciar a liberação.","garages:Impound",v["model"],false,true)
			end

			exports["dynamic"]:openMenu()
		else
			TriggerEvent("Notify","amarelo","Não possui veículos apreendidos.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(garageLocates) do
				local distance = #(coords - vector3(v["x"],v["y"],v["z"]))
				if distance <= 15 then
					timeDistance = 1
					DrawMarker(0,v["x"],v["y"],v["z"] - 0.95,0.0,0.0,0.0,0.0,0.0,0.0,1.75,1.75,0.0,46,110,76,100,0,0,0,0)

					if IsControlJustPressed(1,38) and distance <= 1.0 and MumbleIsConnected() then
						local Vehicles = vSERVER.Vehicles(k)
						if Vehicles then
							if parseInt(#Vehicles) > 0 then
								exports["dynamic"]:SubMenu("Retirar","Mostrar sua lista de veículos.","vehicles")

								for _,v in pairs(Vehicles) do
									exports["dynamic"]:AddButton(v["name"],"Clique para retira-lo.","garages:Spawn",v["model"].."-"..k,"vehicles",true)
								end
							end

							exports["dynamic"]:AddButton("Guardar","Guardar o veículo mais próximo.","garages:Delete","",false,false)

							exports["dynamic"]:openMenu()
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)