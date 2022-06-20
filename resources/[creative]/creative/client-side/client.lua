-----------------------------------------------------------------------------------------------------------------------------------------
-- TYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
local oldSpeed = 0
local Aiming = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- BIKESMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
local bikesModel = {
	[1131912276] = true,
	[448402357] = true,
	[-836512833] = true,
	[-186537451] = true,
	[1127861609] = true,
	[-1233807380] = true,
	[-400295096] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			timeDistance = 1

			DisableControlAction(0,345,true)

			if GetPedConfigFlag(ped,78,true) then
				if not Aiming then
					Aiming = GetFollowVehicleCamViewMode()
				end

				SetFollowVehicleCamViewMode(4)
			else
				if Aiming then
					SetFollowVehicleCamViewMode(Aiming)
					Aiming = false
				end
			end

			local vehicle = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local speed = GetEntitySpeed(vehicle) * 2.236936
				if speed ~= oldSpeed then
					if (oldSpeed - speed) >= 60 then
						TriggerServerEvent("upgradeStress",10)

						if GetVehicleClass(vehicle) ~= 8 then
							SetVehicleEngineOn(vehicle,false,true,true)

							local vehModel = GetEntityModel(vehicle)
								if bikesModel[vehModel] == nil then
							end
						end
					end

					oldSpeed = speed
				end
			end
		else
			if oldSpeed ~= 0 then
				oldSpeed = 0
			end

			if Aiming then
				Aiming = false
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local vehClass = GetVehicleClass(vehicle)
				if (vehClass >= 0 and vehClass <= 7) or vehClass == 9 then
					if IsControlPressed(1,21) then
						local speed = GetEntitySpeed(vehicle) * 2.236936
						if speed <= 75.0 then
							SetVehicleReduceGrip(vehicle,true)

							if not GetDriftTyresEnabled(vehicle) then
								SetDriftTyresEnabled(vehicle,true)
								SetReduceDriftVehicleSuspension(vehicle,true)
							end
						end
					else
						SetVehicleReduceGrip(vehicle,false)

						if GetDriftTyresEnabled(vehicle) then
							SetDriftTyresEnabled(vehicle,false)
							SetReduceDriftVehicleSuspension(vehicle,false)
						end
					end
				end
			end
		end

		Citizen.Wait(100)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
	{ -815.12,-184.15,37.57,71,45,"Barbearia",0.45 },
	{ 138.13,-1706.46,29.3,71,45,"Barbearia",0.45 },
	{ -1280.92,-1117.07,7.0,71,45,"Barbearia",0.45 },
	{ 1930.54,3732.06,32.85,71,45,"Barbearia",0.45 },
	{ 1214.2,-473.18,66.21,71,45,"Barbearia",0.45 },
	{ -33.61,-154.52,57.08,71,45,"Barbearia",0.45 },
	{ -276.65,6226.76,31.7,71,45,"Barbearia",0.45 },
	{ -1389.78,-584.94,30.21,93,45,"Bahamas West Mamas",0.45 },
	{ -38.84,-1110.13,26.44,225,45,"Concessionária",0.45 },
	{ 1225.05,2724.07,38.0,225,45,"Concessionária",0.45 },
	{ -680.9,5832.41,17.32,141,45,"Cabana do Caçador",0.6 },
	{ 405.92,6526.12,27.73,85,45,"Colheita",0.5 },
	{ 426.57,-981.71,30.7,526,18,"Departamento | SAPD",0.5 },
	{ 1857.6,3679.51,33.75,526,16,"Departamento | SHERIFF",0.5 },
	{ -448.18,6011.68,31.71,526,16,"Departamento | SHERIFF",0.5 },
	{ -1728.06,-1050.69,1.71,410,45,"Embarcações",0.5 },
	{ 1966.36,3975.86,31.51,410,45,"Embarcações",0.5 },
	{ -776.72,-1495.02,2.29,410,45,"Embarcações",0.5 },
	{ -893.97,5687.78,3.29,410,45,"Embarcações",0.5 },
	{ 4952.76,-5163.6,-0.3,410,45,"Embarcações",0.5 },
	{ -172.21,6385.85,31.49,403,45,"Farmácia",0.6 },
	{ 1690.07,3581.68,35.62,403,45,"Farmácia",0.6 },
	{ 315.12,-1068.58,29.39,403,45,"Farmácia",0.6 },
	{ 114.45,-4.89,67.82,403,45,"Farmácia",0.6 },
	{ 55.44,-876.17,30.67,357,43,"Garagem",0.5 },
	{ 317.69,2623.28,44.47,357,43,"Garagem",0.5 },
	{ -136.8,6356.84,31.49,357,43,"Garagem",0.5 },
	{ -294.19,-987.01,31.07,357,43,"Garagem",0.5 },
	{ 1141.53,2659.84,38.16,357,43,"Garagem",0.5 },
	{ 1706.97,4791.86,41.97,357,43,"Garagem",0.5 },
	{ -1177.75,-891.44,13.77,357,43,"Garagem",0.5 },
	{ 795.96,-721.37,28.07,357,43,"Garagem",0.5 },
	{ 1577.52,6456.28,25.31,357,43,"Garagem",0.5 },
	{ 145.81,-1058.8,30.18,348,43,"Garagem",0.5 },
	{ -1187.56,-1575.37,4.35,348,43,"Garagem",0.5 },
	{ -773.39,5598.07,33.6,348,43,"Garagem",0.5 },
	{ -836.03,-1211.82,6.84,621,6,"Hospital",0.55 },
	{ -247.42,6331.39,32.42,621,6,"Hospital",0.55 },	
	{ 1840.5,3670.0,33.68,621,6,"Hospital",0.55 },
	{ -260.62,-974.0,31.22,475,10,"Hotel",0.5 },
	{ 1137.46,2672.15,38.06,475,10,"Hotel",0.5 },
	{ 1655.27,4874.31,42.04,374,11,"Imobiliária",0.5 },
	{ -308.09,-163.93,40.42,374,11,"Imobiliária",0.5 },
	{ 1692.62,3759.50,34.70,313,45,"Loja de Armas",0.45 },
	{ 252.89,-49.25,69.94,313,45,"Loja de Armas",0.45 },
	{ 843.28,-1034.02,28.19,313,45,"Loja de Armas",0.45 },
	{ -331.35,6083.45,31.45,313,45,"Loja de Armas",0.45 },
	{ -663.15,-934.92,21.82,313,45,"Loja de Armas",0.45 },
	{ -1305.18,-393.48,36.69,313,45,"Loja de Armas",0.45 },
	{ -1118.80,2698.22,18.55,313,45,"Loja de Armas",0.45 },
	{ 2568.83,293.89,108.73,313,45,"Loja de Armas",0.45 },
	{ -3172.68,1087.10,20.83,313,45,"Loja de Armas",0.45 },
	{ 21.32,-1106.44,29.79,313,45,"Loja de Armas",0.45 },
	{ 811.19,-2157.67,29.61,313,45,"Loja de Armas",0.45 },
	{ 25.68,-1346.6,29.5,52,45,"Loja de Departamento",0.45 },
	{ 2556.47,382.05,108.63,52,45,"Loja de Departamento",0.45 },
	{ 1163.55,-323.02,69.21,52,45,"Loja de Departamento",0.45 },
	{ -707.31,-913.75,19.22,52,45,"Loja de Departamento",0.45 },
	{ -47.72,-1757.23,29.43,52,45,"Loja de Departamento",0.45 },
	{ 373.89,326.86,103.57,52,45,"Loja de Departamento",0.45 },
	{ -3242.95,1001.28,12.84,52,45,"Loja de Departamento",0.45 },
	{ 1729.3,6415.48,35.04,52,45,"Loja de Departamento",0.45 },
	{ 548.0,2670.35,42.16,52,45,"Loja de Departamento",0.45 },
	{ 1960.69,3741.34,32.35,52,45,"Loja de Departamento",0.45 },
	{ 2677.92,3280.85,55.25,52,45,"Loja de Departamento",0.45 },
	{ 1698.5,4924.09,42.07,52,45,"Loja de Departamento",0.45 },
	{ -1820.82,793.21,138.12,52,45,"Loja de Departamento",0.45 },
	{ 1393.21,3605.26,34.99,52,45,"Loja de Departamento",0.45 },
	{ -2967.78,390.92,15.05,52,45,"Loja de Departamento",0.45 },
	{ -3040.14,585.44,7.91,52,45,"Loja de Departamento",0.45 },
	{ 1135.56,-982.24,46.42,52,45,"Loja de Departamento",0.45 },
	{ 1166.0,2709.45,38.16,52,45,"Loja de Departamento",0.45 },
	{ -1487.21,-378.99,40.17,52,45,"Loja de Departamento",0.45 },
	{ -1222.76,-907.21,12.33,52,45,"Loja de Departamento",0.45 },
	{ 159.57,6633.8,31.66,52,45,"Loja de Departamento",0.45 },
	{ -154.2,6329.23,31.56,52,45,"Loja de Departamento",0.45 },	
	{ 817.07,-785.72,26.18,52,45,"Loja de Departamento",0.45 },
	{ -1117.26,-1438.74,5.11,73,45,"Loja de Roupas",0.45 },
	{ 75.35,-1392.92,29.38,73,45,"Loja de Roupas",0.45 },
	{ -710.15,-152.36,37.42,73,45,"Loja de Roupas",0.45 },
	{ -163.73,-303.62,39.74,73,45,"Loja de Roupas",0.45 },
	{ -822.38,-1073.52,11.33,73,45,"Loja de Roupas",0.45 },
	{ -1193.13,-767.93,17.32,73,45,"Loja de Roupas",0.45 },
	{ -1449.83,-237.01,49.82,73,45,"Loja de Roupas",0.45 },
	{ 4.83,6512.44,31.88,73,45,"Loja de Roupas",0.45 },
	{ 1693.95,4822.78,42.07,73,45,"Loja de Roupas",0.45 },
	{ 125.82,-223.82,54.56,73,45,"Loja de Roupas",0.45 },
	{ 614.2,2762.83,42.09,73,45,"Loja de Roupas",0.45 },
	{ 1196.72,2710.26,38.23,73,45,"Loja de Roupas",0.45 },
	{ -3170.53,1043.68,20.87,73,45,"Loja de Roupas",0.45 },
	{ -1101.42,2710.63,19.11,73,45,"Loja de Roupas",0.45 },
	{ 425.6,-806.25,29.5,73,45,"Loja de Roupas",0.45 },
	{ 1945.39,3773.5,32.27,73,45,"Loja de Roupas",0.45 },
	{ 1325.90,-1652.09,52.27,75,45,"Loja de Tatuagens",0.45 },
    { -1151.05,-1425.83,4.95,75,45,"Loja de Tatuagens",0.45 },
    { 320.71,182.87,103.58,75,45,"Loja de Tatuagens",0.45 },
    { -3172.58,1074.11,20.82,75,45,"Loja de Tatuagens",0.45 },
    { 1863.28,3747.38,33.03,75,45,"Loja de Tatuagens",0.45 },
    { -293.07,6200.77,31.48,75,45,"Loja de Tatuagens",0.45 },
	{ 82.54,-1553.28,29.59,318,45,"Lixeiro",0.45 },
	{ 287.36,2843.6,44.7,318,45,"Lixeiro",0.45 },
	{ -413.97,6171.58,31.48,318,45,"Lixeiro",0.45 },
	{ -840.21,5399.25,34.61,285,45,"Lenhador",0.45 },
	{ -1447.47,-1043.51,4.8,495,45,"Salva Vidas",0.45 },
	{ -1082.22,-247.54,37.77,439,13,"Life Invader",0.5 },
	{ 2964.43,2752.88,43.32,617,45,"Minerador",0.5 },
	{ 46.66,-1749.79,29.64,52,11,"Mercado Central",0.45 },
	{ 2747.28,3473.04,55.67,52,11,"Mercado Central",0.45 },
	{ 830.44,-812.82,26.34,402,13,"Mecânica",0.65 },
	{ -535.04,-221.34,37.64,58,5,"Prefeitura",0.5 },
	{ 562.36,2741.56,42.87,273,45,"Pet Shop",0.5 },
	{ 265.64,-1261.30,29.29,361,45,"Posto de Gasolina",0.35 },
    { 819.65,-1028.84,26.40,361,45,"Posto de Gasolina",0.35 },
    { 1208.95,-1402.56,35.22,361,45,"Posto de Gasolina",0.35 },
    { 1181.38,-330.84,69.31,361,45,"Posto de Gasolina",0.35 },
    { 620.84,269.10,103.08,361,45,"Posto de Gasolina",0.35 },
    { 2581.32,362.03,108.46,361,45,"Posto de Gasolina",0.35 },
    { 176.63,-1562.02,29.26,361,45,"Posto de Gasolina",0.35 },
    { 176.63,-1562.02,29.26,361,45,"Posto de Gasolina",0.35 },
    { -319.29,-1471.71,30.54,361,45,"Posto de Gasolina",0.35 },
    { 1784.32,3330.55,41.25,361,45,"Posto de Gasolina",0.35 },
    { 49.418,2778.79,58.04,361,45,"Posto de Gasolina",0.35 },
    { 263.89,2606.46,44.98,361,45,"Posto de Gasolina",0.35 },
    { 1039.95,2671.13,39.55,361,45,"Posto de Gasolina",0.35 },
    { 1207.26,2660.17,37.89,361,45,"Posto de Gasolina",0.35 },
    { 2539.68,2594.19,37.94,361,45,"Posto de Gasolina",0.35 },
    { 2679.85,3263.94,55.24,361,45,"Posto de Gasolina",0.35 },
    { 2005.05,3773.88,32.40,361,45,"Posto de Gasolina",0.35 },
    { 1687.15,4929.39,42.07,361,45,"Posto de Gasolina",0.35 },
    { 1701.31,6416.02,32.76,361,45,"Posto de Gasolina",0.35 },
    { 179.85,6602.83,31.86,361,45,"Posto de Gasolina",0.35 },
    { -94.46,6419.59,31.48,361,45,"Posto de Gasolina",0.35 },
    { -2554.99,2334.40,33.07,361,45,"Posto de Gasolina",0.35 },
    { -1800.37,803.66,138.65,361,45,"Posto de Gasolina",0.35 },
    { -1437.62,-276.74,46.20,361,45,"Posto de Gasolina",0.35 },
    { -2096.24,-320.28,13.16,361,45,"Posto de Gasolina",0.35 },
    { -724.61,-935.16,19.21,361,45,"Posto de Gasolina",0.35 },
    { -526.01,-1211.00,18.18,361,45,"Posto de Gasolina",0.35 },
    { -70.21,-1761.79,29.53,361,45,"Posto de Gasolina",0.35 },
	{ 804.12,-789.56,26.2,361,45,"Posto de Gasolina",0.35 },
	{ -191.92,-1155.04,23.05,50,45,"Reboque",0.48 },
	{ 1724.84,3715.31,34.22,50,45,"Reboque",0.48 },
	{ -273.96,6121.63,31.41,50,45,"Reboque",0.48 },
	{ -428.56,-1728.33,19.79,467,11,"Reciclagem",0.5 },
	{ 180.07,2793.29,45.65,467,11,"Reciclagem",0.5 },
	{ -195.42,6264.62,31.49,467,11,"Reciclagem",0.5 },
	{ -741.56,5594.94,41.66,36,45,"Teleférico",0.5 },
	{ 454.46,5571.95,781.19,36,45,"Teleférico",0.5 },
	{ 356.42,274.61,103.14,67,45,"Transportador",0.45 },
	{ 919.38,-182.83,74.02,198,45,"Taxista",0.45 },
	{ 1696.19,4785.25,42.02,198,45,"Taxista",0.45 },
	{ 1525.07,3784.92,34.49,103,45,"The Boat House",0.4 },
	{ -565.14,271.56,83.02,93,45,"Tequi-La-La",0.45 },
	{ 132.6,-1305.06,29.2,93,45,"Vanilla Unicorn",0.45 },
	{ -604.39,-933.23,23.86,184,45,"Weazel News",0.5 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,25 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()

		SetCreateRandomCops(false)
		CancelCurrentPoliceReport()
		SetCreateRandomCopsOnScenarios(false)
		SetCreateRandomCopsNotOnScenarios(false)

		SetVehicleModelIsSuppressed(GetHashKey("jet"),true)
		SetVehicleModelIsSuppressed(GetHashKey("besra"),true)
		SetVehicleModelIsSuppressed(GetHashKey("luxor"),true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp"),true)
		SetVehicleModelIsSuppressed(GetHashKey("polmav"),true)
		SetVehicleModelIsSuppressed(GetHashKey("buzzard2"),true)
		SetVehicleModelIsSuppressed(GetHashKey("mammatus"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prismuscl_01"),true)
		SetPedModelIsSuppressed(GetHashKey("u_m_y_prisoner_01"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prisoner_01"),true)

		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		SetWeaponDamageModifierThisFrame("WEAPON_BAT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HAMMER",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_WRENCH",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_UNARMED",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_CROWBAR",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_MACHETE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_POOLCUE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KNUCKLE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_GOLFCLUB",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_BATTLEAXE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_FLASHLIGHT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_NIGHTSTICK",0.35)
		SetWeaponDamageModifierThisFrame("WEAPON_STONE_HATCHET",0.25)

		RemoveAllPickupsOfType("PICKUP_WEAPON_KNIFE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PISTOL")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MINISMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MICROSMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PUMPSHOTGUN")
		RemoveAllPickupsOfType("PICKUP_WEAPON_CARBINERIFLE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_SAWNOFFSHOTGUN")

		DisablePlayerVehicleRewards(PlayerId())

		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(10)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)

		DisableControlAction(1,37,true)
		DisableControlAction(1,204,true)
		DisableControlAction(1,211,true)
		DisableControlAction(1,349,true)
		DisableControlAction(1,192,true)
		DisableControlAction(1,157,true)
		DisableControlAction(1,158,true)
		DisableControlAction(1,159,true)
		DisableControlAction(1,160,true)
		DisableControlAction(1,161,true)
		DisableControlAction(1,162,true)
		DisableControlAction(1,163,true)
		DisableControlAction(1,164,true)
		DisableControlAction(1,165,true)

		SetRandomVehicleDensityMultiplierThisFrame(0.5)
		SetVehicleDensityMultiplierThisFrame(0.5)
		SetGarbageTrucks(false)
		SetRandomBoats(false)

		if IsPedArmed(PlayerPedId(),6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		Citizen.Wait(1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
local ipList = {
	{
		props = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		coords = { -1150.70,-1520.70,10.60 }
	},{
		props = {
			"csr_beforeMission",
			"csr_inMission"
		},
		coords = { -47.10,-1115.30,26.50 }
	},{
		props = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		coords = { -802.30,175.00,72.80 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADIPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _k,_v in pairs(ipList) do
		local interiorCoords = GetInteriorAtCoords(_v["coords"][1],_v["coords"][2],_v["coords"][3])
		LoadInterior(interiorCoords)

		if _v["props"] ~= nil then
			for k,v in pairs(_v["props"]) do
				EnableInteriorProp(interiorCoords,v)
				Citizen.Wait(1)
			end
		end

		RefreshInterior(interiorCoords)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local teleport = {
	{ 330.19,-601.21,43.29,343.65,-581.77,28.8 },
	{ 343.65,-581.77,28.8,330.19,-601.21,43.29 },

	{ 327.16,-603.53,43.29,338.97,-583.85,74.16 },
	{ 338.97,-583.85,74.16,327.16,-603.53,43.29 },

	{ -741.07,5593.13,41.66,446.19,5568.79,781.19 },
	{ 446.19,5568.79,781.19,-741.07,5593.13,41.66 },

	{ -740.78,5597.04,41.66,446.37,5575.02,781.19 },
	{ 446.37,5575.02,781.19,-740.78,5597.04,41.66 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local innerTable = {}

	for k,v in pairs(teleport) do
		table.insert(innerTable,{ v[1],v[2],v[3],1,"E","Porta de Acesso","Pressione para acessar" })
	end

	TriggerEvent("hoverfy:insertTable",innerTable)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for _,v in pairs(teleport) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1 then
					timeDistance = 1

					if IsControlJustPressed(1,38) then
						SetEntityCoords(ped,v[4],v[5],v[6],1,0,0,0)
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			local distance = #(coords - vector3(254.01,225.21,101.87))
			if distance <= 3.0 then
				timeDistance = 1

				if IsControlJustPressed(1,38) then
					local handle,object = FindFirstObject()
					local finished = false

					repeat
						local heading = GetEntityHeading(object)
						local coordsObj = GetEntityCoords(object)
						local distanceObjs = #(coordsObj - coords)

						if distanceObjs < 3.0 and GetEntityModel(object) == 961976194 then
							if heading > 150.0 then
								SetEntityHeading(object,0.0)
							else
								SetEntityHeading(object,160.0)
							end

							FreezeEntityPosition(object,true)
							finished = true
						end

						finished,object = FindNextObject(handle)
					until not finished

					EndFindObject(handle)
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	TriggerEvent("hoverfy:insertTable",{{ 254.01,225.21,101.87,1.5,"E","Porta do Cofre","Pressione para abrir/fechar" }})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUNNYHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local bunnyHope = GetGameTimer()
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			if GetGameTimer() <= bunnyHope then
				timeDistance = 1
				DisableControlAction(1,22,true)
			else
				if IsPedJumping(ped) then
					bunnyHope = GetGameTimer() + 5000
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINPUTROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0,rotation.x + rightAxisY * -1.0 * (3.0) * (zoomvalue + 0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLEZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
function HandleZoom(cam)
	if IsControlJustPressed(1,241) then
		fov = math.max(fov - zoomspeed,fov_min)
	end

	if IsControlJustPressed(1,242) then
		fov = math.min(fov + zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov - current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov + (fov - current_fov) * 0.05)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVISIBLABLES
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]["Invisible"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHACKER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			local ped = PlayerPedId()

			if not IsEntityVisible(ped) and not LocalPlayer["state"]["Invisible"] then
				TriggerServerEvent("admin:Hacker","está invisível")
			end

			if ForceSocialClubUpdate == nil then
				TriggerServerEvent("admin:Hacker","forçou a social club.")
			end

			if ShutdownAndLaunchSinglePlayerGame == nil then
				TriggerServerEvent("admin:Hacker","entrou no modo single player.")
			end

			if ActivateRockstarEditor == nil then
				TriggerServerEvent("admin:Hacker","ativou o rockstar editor.")
			end
		end

		Citizen.Wait(10000)
	end
end)