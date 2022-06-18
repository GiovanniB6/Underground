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
Tunnel.bindInterface("works",cRP)
vCLIENT = Tunnel.getInterface("works")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local works = {
	["Transportador"] = {
		["coords"] = { 354.27,271.06,103.04 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = true,
		["deliveryVehicle"] = 1747439474,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 10,
		["collectDuration"] = 10000,
		["collectText"] = "VASCULHAR",
		["deliveryText"] = "ENTREGAR",
		["collectAnim"] = { false,"amb@prop_human_atm@male@idle_a","idle_a",true },
		["collectConsume"] = {
			["min"] = 2,
			["max"] = 3
		},
		["collectCoords"] = {
			{ 263.11,216.8,101.69,340.16 },
			{ 263.98,216.49,101.69,342.07 },
			{ 264.78,216.19,101.69,341.62 },
			{ 265.64,215.87,101.69,345.01 },
			{ 266.46,215.51,101.69,345.13 },
			{ 266.63,214.9,101.69,253.25 },
			{ 266.38,214.22,101.69,253.76 },
			{ 266.1,213.44,101.69,252.3 },
			{ 265.8,212.68,101.69,254.85 },
			{ 265.58,212.02,101.69,256.95 },
			{ 264.91,211.73,101.69,158.15 },
			{ 264.13,211.98,101.69,159.89 },
			{ 263.16,212.33,101.69,165.34 },
			{ 262.4,212.62,101.69,161.24 },
			{ 261.67,212.88,101.69,161.44 }
		},
		["deliveryItem"] = "pouch",
		["deliveryName"] = "Malotes",
		["deliveryConsume"] = {
			["min"] = 2,
			["max"] = 3
		},
		["deliveryCoords"] = {
			{ 285.47,143.37,104.17,158.75 },
			{ 527.36,-160.7,57.09,272.13 },
			{ 1153.64,-326.75,69.2,99.22 },
			{ 1167.01,-456.07,66.79,345.83 },
			{ 1138.25,-468.9,66.73,73.71 },
			{ 1077.71,-776.5,58.23,187.09 },
			{ 315.09,-593.65,43.29,65.2 },
			{ 296.46,-894.25,29.23,249.45 },
			{ 295.76,-896.14,29.22,252.29 },
			{ 147.58,-1035.79,29.34,161.58 },
			{ 145.93,-1035.19,29.34,161.58 },
			{ 289.1,-1256.87,29.44,277.8 },
			{ 288.82,-1282.36,29.64,272.13 },
			{ 126.85,-1296.59,29.27,25.52 },
			{ 127.84,-1296.03,29.27,28.35 },
			{ 33.16,-1348.25,29.49,175.75 },
			{ 24.48,-945.95,29.35,343.0 },
			{ 5.24,-919.83,29.55,252.29 },
			{ 112.58,-819.4,31.34,158.75 },
			{ 114.44,-776.41,31.41,343.0 },
			{ 111.25,-775.25,31.44,345.83 },
			{ -27.99,-724.54,44.23,345.83 },
			{ -30.19,-723.71,44.23,343.0 },
			{ -203.8,-861.37,30.26,31.19 },
			{ -301.7,-830.01,32.42,351.5 },
			{ -303.24,-829.74,32.42,354.34 },
			{ -258.87,-723.38,33.48,70.87 },
			{ -256.2,-715.99,33.53,73.71 },
			{ -254.41,-692.49,33.6,161.58 },
			{ -537.85,-854.49,29.28,178.59 },
			{ -660.73,-854.07,24.48,187.09 },
			{ -710.01,-818.9,23.72,0.0 },
			{ -712.89,-818.92,23.72,0.0 },
			{ -717.7,-915.65,19.21,85.04 },
			{ -821.63,-1081.88,11.12,31.19 },
			{ -1315.71,-834.75,16.95,314.65 },
			{ -1314.75,-836.03,16.95,314.65 },
			{ -1305.41,-706.37,25.33,127.56 },
			{ -1570.14,-546.72,34.95,218.27 },
			{ -1571.06,-547.39,34.95,215.44 },
			{ -1415.94,-212.04,46.51,235.28 },
			{ -1430.18,-211.06,46.51,113.39 },
			{ -1409.76,-100.47,52.39,104.89 },
			{ -1410.32,-98.75,52.42,110.56 },
			{ -1282.52,-210.92,42.44,306.15 },
			{ -1286.28,-213.44,42.44,119.06 },
			{ -1285.54,-224.32,42.44,306.15 },
			{ -1289.31,-226.78,42.44,124.73 },
			{ -1205.02,-326.3,37.83,113.39 },
			{ -1205.78,-324.8,37.86,116.23 },
			{ -866.69,-187.74,37.84,121.89 },
			{ -867.63,-186.07,37.84,119.06 },
			{ -846.31,-341.26,38.67,113.39 },
			{ -846.81,-340.2,38.67,116.23 },
			{ -721.06,-415.58,34.98,269.3 },
			{ -556.18,-205.18,38.22,119.06 },
			{ -57.66,-92.65,57.78,294.81 },
			{ 89.73,2.46,68.29,343.0 },
			{ -165.17,232.77,94.91,90.71 },
			{ -165.16,234.8,94.91,85.04 },
			{ 158.6,234.23,106.63,343.0 },
			{ 228.18,338.38,105.56,158.75 },
			{ 380.76,323.4,103.56,158.75 },
			{ 357.01,173.54,103.07,340.16 }
		},
		["deliveryPayment"] = {
			["min"] = 28,
			["max"] = 34,
			["item"] = "dollars"
		}
	},
	["Lenhador"] = {
		["coords"] = { -840.21,5399.25,34.61 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["deliveryVehicle"] = -667151410,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 150,
		["collectDuration"] = 3000,
		["collectText"] = "CORTAR",
		["deliveryText"] = "ENTREGAR",
		["collectAnim"] = { false,"melee@hatchet@streamed_core","plyr_front_takedown_b",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ -642.97,5461.49,53.42,161.0 },
			{ -632.4,5466.41,53.66,283.15 },
			{ -629.19,5470.14,53.64,312.44 },
			{ -625.47,5474.39,53.31,131.34 },
			{ -620.03,5488.33,51.58,312.19 },
			{ -633.65,5505.16,51.26,33.24 },
			{ -637.87,5503.96,51.48,57.04 },
			{ -662.4,5496.55,48.73,120.35 },
			{ -666.62,5497.73,47.89,88.0 },
			{ -660.21,5490.28,49.71,293.86 },
			{ -637.85,5441.62,52.52,192.87 },
			{ -616.07,5433.55,53.41,228.47 },
			{ -615.3,5424.46,51.07,102.64 },
			{ -595.79,5450.51,58.97,315.87 },
			{ -586.94,5447.71,60.17,265.4 },
			{ -597.49,5472.95,56.5,23.67 },
			{ -583.59,5490.44,55.83,24.95 },
			{ -588.84,5493.79,54.45,32.45 },
			{ -617.65,5489.06,51.64,93.35 },
			{ -619.22,5498.12,51.31,122.45 }
		},
		["deliveryItem"] = "woodlog",
		["deliveryName"] = "Toras de Madeira",
		["deliveryConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["deliveryCoords"] = {
			{ -513.92,-1019.31,23.47 },
			{ -1604.18,-832.26,10.08 },
			{ -536.48,-45.61,42.57 },
			{ -53.01,79.35,71.62 },
			{ 581.16,139.13,99.48 },
			{ 814.39,-93.48,80.6 },
			{ 1106.93,-355.03,67.01 },
			{ 1070.71,-780.46,58.36 },
			{ 1142.82,-986.58,45.91 },
			{ 1200.55,-1276.6,35.23 },
			{ 967.81,-1829.29,31.24 },
			{ 809.16,-2222.61,29.65 },
			{ 684.61,-2741.62,6.02 },
			{ 263.47,-2506.62,6.45 },
			{ 94.66,-2676.38,6.01 },
			{ -43.87,-2519.91,7.4 },
			{ 182.93,-2027.68,18.28 },
			{ -306.86,-2191.84,10.84 },
			{ -570.95,-1775.95,23.19 },
			{ -350.03,-1569.9,25.23 },
			{ -128.36,-1394.12,29.57 },
			{ 67.84,-1399.02,29.37 },
			{ 343.13,-1297.91,32.51 },
			{ 485.92,-1477.41,29.29 },
			{ 139.81,-1337.41,29.21 },
			{ 263.82,-1346.16,31.93 },
			{ -723.33,-1112.41,10.66 },
			{ -842.54,-1128.21,7.02 },
			{ 488.46,-898.56,25.94 }
		},
		["deliveryPayment"] = {
			["min"] = 35,
			["max"] = 42,
			["item"] = "dollars"
		}
	},
	["Minerador"] = {
		["coords"] = { 2964.43,2752.88,43.32 },
		["upgradeStress"] = 3,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = true,
		["collectText"] = "MINERAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 500,
		["collectDuration"] = 10000,
		["collectAnim"] = { false,"amb@world_human_const_drill@male@drill@base","base",true },
		["collectCoords"] = {
			{ 2959.2,2819.94,43.73,65.2 },
			{ 2956.05,2819.97,43.19,93.55 },
			{ 2950.91,2816.4,42.85,357.17 },
			{ 2948.17,2820.81,43.59,127.56 },
			{ 2944.54,2820.16,43.54,198.43 },
			{ 2944.26,2818.67,43.54,161.58 },
			{ 2938.44,2813.13,43.46,147.41 },
			{ 2936.71,2814.08,44.01,175.75 },
			{ 2931.18,2816.95,45.7,215.44 },
			{ 2926.25,2813.29,45.61,289.14 },
			{ 2918.15,2800.09,41.85,65.2 },
			{ 2921.21,2799.06,42.14,204.1 },
			{ 2925.57,2796.28,41.47,235.28 },
			{ 2925.34,2794.94,41.5,195.6 },
			{ 2925.86,2792.42,41.28,206.93 },
			{ 2928.12,2790.6,40.86,277.8 },
			{ 2928.28,2789.03,40.61,113.39 },
			{ 2930.6,2786.87,40.12,257.96 },
			{ 2934.52,2784.27,40.17,136.07 },
			{ 2937.04,2774.52,39.7,218.27 },
			{ 2938.37,2774.23,39.77,266.46 },
			{ 2937.35,2771.71,39.93,229.61 },
			{ 2939.83,2770.54,39.73,218.27 },
			{ 2939.0,2769.14,39.7,158.75 },
			{ 2947.51,2765.82,40.46,343.0 },
			{ 2948.1,2767.44,39.83,124.73 },
			{ 2952.48,2767.8,40.0,68.04 },
			{ 2953.53,2770.22,39.6,161.58 },
			{ 2956.16,2773.09,40.24,218.27 },
			{ 2957.73,2772.77,40.32,45.36 },
			{ 2964.33,2773.9,40.07,133.23 },
			{ 2968.58,2773.65,38.72,308.98 },
			{ 2969.44,2775.79,39.66,53.86 },
			{ 2972.23,2775.18,39.24,291.97 },
			{ 2980.9,2781.9,40.12,240.95 },
			{ 2982.0,2786.89,41.18,294.81 },
			{ 2979.17,2790.98,41.67,82.21 },
			{ 2977.18,2792.37,41.4,39.69 },
			{ 2976.37,2794.84,41.65,229.61 },
			{ 2976.72,2796.2,41.55,269.3 },
			{ 2972.18,2799.39,42.14,354.34 },
			{ 2991.38,2776.52,43.79,79.38 },
			{ 3002.92,2773.51,43.74,65.2 },
			{ 2983.39,2763.71,43.59,172.92 },
			{ 2980.99,2764.29,43.22,107.72 },
			{ 2988.26,2754.15,43.52,238.12 },
			{ 2993.57,2751.79,44.13,68.04 },
			{ 2993.75,2753.27,43.73,28.35 },
			{ 2959.46,2759.03,42.51,127.56 },
			{ 2955.49,2756.5,44.43,136.07 },
			{ 2954.1,2754.28,43.96,158.75 },
			{ 2947.5,2754.43,44.01,343.0 },
			{ 2943.41,2756.52,43.66,153.08 },
			{ 2942.35,2760.44,42.73,325.99 },
			{ 2937.35,2757.3,44.69,334.49 },
			{ 2931.0,2761.97,45.07,42.52 },
			{ 2928.76,2765.45,44.65,343.0 },
			{ 2928.2,2767.79,44.35,348.67 },
			{ 2939.94,2746.5,43.83,51.03 },
			{ 2939.45,2741.82,44.69,266.46 },
			{ 2948.96,2738.84,45.12,150.24 },
			{ 2948.37,2732.15,45.88,255.12 },
			{ 2945.11,2733.7,46.07,19.85 },
			{ 2948.14,2728.15,47.13,277.8 },
			{ 2972.23,2739.51,44.18,289.14 }
		}
	},
	["Mergulhador"] = {
		["coords"] = { 1520.56,3780.08,34.46 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = true,
		["collectText"] = "VASCULHAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 500,
		["collectDuration"] = 12500,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 2,
			["max"] = 3
		},
		["collectCoords"] = {
			{ 1018.69,4095.91,12.7 },
			{ 963.91,4036.36,3.35 },
			{ 960.66,3973.73,1.11 },
			{ 1015.39,3959.19,-3.0 },
			{ 1064.1,3974.58,-12.5 },
			{ 1045.07,4008.94,-12.45 },
			{ 995.48,4048.54,4.52 },
			{ 961.85,4034.99,2.95 },
			{ 907.1,3958.09,-4.3 },
			{ 935.89,3911.83,-9.69 },
			{ 927.22,3836.77,3.79 },
			{ 935.42,3791.86,16.85 },
			{ 975.34,3800.73,16.55 },
			{ 1030.63,3823.97,9.64 },
			{ 1068.02,3863.78,-7.23 },
			{ 1138.51,3991.73,-4.28 },
			{ 1093.69,4050.16,0.86 },
			{ 1045.61,4141.31,21.85 }
		},
		["deliveryItem"] = {
			"key",
			"octopus",
			"shrimp",
			"carp",
			"codfish",
			"catfish",
			"goldenfish",
			"horsefish",
			"tilapia",
			"pacu",
			"pirarucu",
			"tambaqui",
			"bait",
			"emptybottle",
			"plastic",
			"glass",
			"rubber",
			"aluminum",
			"copper",
			"silvercoin",
			"goldcoin"
		}
	},
	
	--------------
	-- COLHEITA --
	--------------
	
	["Laranja"] = {
		["coords"] = { 383.61,6496.83,28.46,189.93 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@prop_human_movie_bulb@base","base",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 378.31,6506.08,27.95 },
			{ 370.4,6506.21,28.41 },
			{ 363.39,6506.17,28.54 },
			{ 355.69,6505.39,28.48 },
			{ 348.16,6505.63,28.8 },
			{ 340.0,6505.86,28.7 },
			{ 331.35,6505.55,28.51 },
			{ 322.12,6505.06,29.18 },
			{ 378.51,6517.79,28.34 },
			{ 370.41,6517.69,28.37 },
			{ 363.16,6517.9,28.29 },
			{ 355.94,6517.51,28.16 },
			{ 348.1,6517.63,28.75 },
			{ 339.35,6517.47,28.93 },
			{ 330.8,6517.82,28.95 },
			{ 322.4,6517.65,29.12 },
			{ 322.33,6531.14,29.12 },
			{ 329.9,6531.26,28.58 },
			{ 338.3,6530.77,28.54 },
			{ 345.53,6531.32,28.73 },
			{ 353.39,6530.73,28.39 },
			{ 361.42,6530.99,28.36 },
			{ 368.88,6531.62,28.39 }
		},
		["deliveryItem"] = "orange"
	},
	
		["Trigo"] = {
		["coords"] = { 293.41,6484.83,29.84,5.67 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@world_human_gardener_plant@female@base","base_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 264.48,6470.0,30.94 },
			{ 264.31,6472.66,30.85 },
			{ 264.14,6474.59,30.85 },
			{ 263.95,6476.48,30.7 },
			{ 263.89,6478.04,30.62 },
			{ 263.57,6479.93,30.55 }, --
			{ 266.27,6480.32,30.5 },
			{ 270.81,6480.45,30.38 },
			{ 275.71,6480.97,30.28 },
			{ 279.57,6481.34,30.16 },
			{ 284.22,6481.75,30.04 },
			{ 266.91,6478.2,30.57 },
			{ 271.68,6478.67,30.45 },
			{ 276.24,6479.04,30.33 },
			{ 280.17,6479.37,30.23 },
			{ 285.68,6479.82,30.11 },
			{ 267.05,6476.23,30.65 },
			{ 270.41,6476.55,30.57 },
			{ 274.99,6477.06,30.45, },
			{ 278.95,6477.34,30.35 },
			{ 283.68,6477.66,30.18 },
			{ 269.37,6474.61,30.73 },
			{ 273.35,6474.89,30.65 },
			{ 278.63,6475.02,30.51 },
			{ 283.02,6475.98,30.36 },
			{ 286.36,6475.96,30.31 },
			{ 270.1,6472.33,30.73 },
			{ 274.13,6472.92,30.63 },
			{ 278.23,6473.36,30.53 },
			{ 283.14,6473.71,30.36 },
			{ 268.15,6470.26,30.89 },
			{ 274.07,6470.85,30.75 },
			{ 280.15,6471.38,30.58 },
			{ 285.67,6471.91,30.46 }
		},
		["deliveryItem"] = "wheat"
	},
	
		["Tomate"] = {
		["coords"] = { 325.9,6486.56,29.08,354.34 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@world_human_gardener_plant@female@base","base_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 329.71,6483.51,29.42 },
			{ 329.65,6482.01,29.49 },
			{ 329.65,6479.73,29.59 },
			{ 329.45,6478.37,29.66 },
			{ 329.4,6476.54,29.76 },
			{ 329.64,6470.34,30.14 },
			{ 329.58,6468.86,30.25 },
			{ 329.52,6466.41,30.33 },
			{ 329.58,6464.6,30.38 },
			{ 329.46,6462.99,30.41 },
			{ 322.65,6462.64,30.6 },
			{ 322.59,6463.64,30.53 },
			{ 322.58,6465.49,30.4 },
			{ 322.59,6467.11,30.28 },
			{ 322.61,6468.3,30.18 },
			{ 322.66,6469.73,30.09 },
			{ 322.66,6476.11,29.76 },
			{ 322.61,6477.63,29.66 },
			{ 322.58,6479.23,29.57 },
			{ 322.79,6481.15,29.49 },
			{ 322.77,6482.3,29.42 },
			{ 322.8,6483.63,29.35 }
		},
		["deliveryItem"] = "tomato"
	},
	
		["Alface"] = {
		["coords"] = { 386.73,6489.33,28.39,0.0 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@world_human_gardener_plant@female@base","base_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 384.56,6486.77,28.66 },
			{ 384.32,6481.65,29.15 },
			{ 384.47,6476.04,29.72 },
			{ 382.15,6486.72,28.75 },
			{ 382.16,6482.98,29.05 },
			{ 382.21,6479.16,29.49 },
			{ 382.21,6475.35,29.81 },
			{ 382.13,6470.93,30.13 },
			{ 380.0,6486.47,28.83 },
			{ 379.89,6481.88,29.23 },
			{ 379.93,6477.22,29.67 },
			{ 379.76,6472.09,30.04 },
			{ 380.0,6465.96,30.3 },
			{ 377.73,6487.34,28.78 },
			{ 377.73,6482.66,29.25 },
			{ 377.7,6479.86,29.47 },
			{ 377.64,6475.22,29.77 },
			{ 377.61,6469.32,30.11 },
			{ 377.66,6463.48,30.38 },
			{ 375.28,6487.42,28.86 },
			{ 375.18,6482.22,29.37 },
			{ 375.29,6477.05,29.67 },
			{ 375.24,6473.04,29.91 },
			{ 375.21,6467.24,30.16 },
			{ 375.39,6462.73,30.4 },
			{ 373.14,6486.28,29.08 },
			{ 373.07,6480.91,29.49 },
			{ 373.01,6476.15,29.76 },
			{ 372.91,6471.0,30.03 },
			{ 373.15,6465.13,30.31 },
			{ 373.05,6459.63,30.46 },
			{ 370.67,6486.02,29.13 },
			{ 370.7,6480.45,29.55 },
			{ 370.71,6475.05,29.84 },
			{ 370.75,6470.0,30.11 },
			{ 370.61,6465.95,30.31 },
			{ 370.73,6460.01,30.46 },
			{ 368.62,6485.97,29.1 },
			{ 368.51,6480.24,29.52 },
			{ 368.52,6475.15,29.82 },
			{ 368.37,6470.93,30.08 },
			{ 368.33,6465.66,30.35 },
			{ 368.51,6460.04,30.43 }
		},
		["deliveryItem"] = "lettuce"
	},
	
		["Morango"] = {
		["coords"] = { 360.31,6486.28,28.76,0.0 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@world_human_gardener_plant@female@base","base_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 364.32,6483.25,29.22 },
			{ 364.22,6481.79,29.34 },
			{ 364.25,6480.31,29.47 },
			{ 364.13,6478.61,29.62 },
			{ 364.25,6477.26,29.71 },
			{ 364.03,6475.61,29.81 },
			{ 364.08,6469.76,30.16 },
			{ 364.05,6468.18,30.25 },
			{ 364.05,6466.66,30.26 },
			{ 364.03,6464.77,30.31 },
			{ 364.01,6462.65,30.35 },
			{ 357.55,6464.48,30.33 },
			{ 357.26,6466.4,30.28 },
			{ 357.2,6469.14,30.11 },
			{ 357.17,6470.76,30.03 },
			{ 357.14,6472.19,29.96 },
			{ 357.26,6475.85,29.74 },
			{ 357.29,6477.45,29.64 },
			{ 357.34,6478.99,29.54 },
			{ 357.3,6480.59,29.42 },
			{ 357.33,6481.93,29.34 },
			{ 357.34,6483.54,29.22 }
		},
		["deliveryItem"] = "strawberry"
	},
	
		["Batata"] = {
		["coords"] = { 290.81,6485.03,29.98,5.67 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@world_human_gardener_plant@female@base","base_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 269.12,6460.41,31.34 },
			{ 268.94,6462.35,31.24 },
			{ 268.57,6464.21,31.16 },
			{ 268.24,6466.75,31.05 },
			{ 267.97,6468.55,30.97 }, --
			{ 271.94,6468.66,30.92 },
			{ 275.45,6469.1,30.82 },
			{ 279.92,6469.35,30.73 },
			{ 285.86,6469.68,30.55 },
			{ 271.19,6466.65,31.02 },
			{ 275.28,6466.84,30.95 },
			{ 279.93,6467.42,30.84 },
			{ 285.31,6467.89,30.68 },
			{ 272.15,6464.76,31.09 },
			{ 276.77,6465.12,31.0 },
			{ 281.52,6465.45,30.9 },
			{ 286.53,6466.07,30.73 },
			{ 271.71,6462.7,31.21 },
			{ 276.82,6463.17,31.12 },
			{ 281.91,6463.6,31.04 },
			{ 286.69,6463.89,30.95 },
			{ 272.56,6460.63,31.32 },
			{ 275.35,6460.9,31.27 },
			{ 279.14,6461.33,31.22 },
			{ 283.22,6461.62,31.14 },
			{ 286.86,6461.98,31.05 }
		},
		["deliveryItem"] = "potato"
	},
	
		["Banana"] = {
		["coords"] = { 292.01,6496.09,29.81,178.59 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@prop_human_movie_bulb@base","base",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 282.74,6506.6,30.09 },
			{ 273.84,6507.0,30.4 },
			{ 264.56,6506.23,30.67 },
			{ 256.57,6503.81,30.85 },
			{ 247.26,6503.12,31.04 },
			{ 237.47,6501.88,31.19 },
			{ 228.51,6501.71,31.31 },
			{ 220.57,6499.39,31.37 },
			{ 210.51,6498.27,31.46 },
			{ 202.08,6497.13,31.48 },
			{ 199.77,6508.26,31.51 },
			{ 208.0,6509.9,31.48 },
			{ 217.46,6510.33,31.41 },
			{ 225.38,6511.65,31.32 },
			{ 234.02,6512.95,31.24 },
			{ 245.12,6514.88,31.07 },
			{ 253.26,6514.57,30.92 },
			{ 261.75,6516.4,30.72 },
			{ 271.32,6519.09,30.46 },
			{ 280.91,6519.01,30.16 },
			{ 280.95,6530.68,30.18 },
			{ 271.03,6530.37,30.48 },
			{ 262.0,6527.91,30.73 },
			{ 252.37,6527.58,30.95 },
			{ 243.54,6526.45,31.1 },
			{ 233.91,6524.8,31.24 },
			{ 223.88,6524.15,31.34 }
		},
		["deliveryItem"] = "banana"
	},
	
		["Cenoura"] = {
		["coords"] = { 292.2,6484.98,29.77,5.67 },
		["upgradeStress"] = 1,
		["routeCollect"] = false,
		["routeDelivery"] = false,
		["usingVehicle"] = false,
		["collectRandom"] = false,
		["collectText"] = "COLETAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 100,
		["collectDuration"] = 6000,
		["collectAnim"] = { false,"amb@world_human_gardener_plant@female@base","base_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 268.94,6446.47,31.83 },
			{ 267.62,6448.46,31.81 },
			{ 267.33,6450.44,31.73 },
			{ 266.99,6452.48,31.66 },
			{ 266.71,6454.24,31.58 },
			{ 266.51,6456.37,31.51 }, --
			{ 269.82,6456.55,31.49 },
			{ 273.75,6456.78,31.46 },
			{ 279.21,6457.43,31.39 },
			{ 283.17,6457.84,31.37 },
			{ 286.53,6457.9,31.34 },
			{ 268.77,6454.25,31.59 },
			{ 273.13,6454.71,31.58 },
			{ 277.11,6455.12,31.51 },
			{ 280.94,6455.33,31.53 },
			{ 285.18,6455.85,31.48 },
			{ 269.78,6452.43,31.68 },
			{ 273.87,6452.85,31.68 },
			{ 277.79,6453.13,31.66 },
			{ 281.68,6453.53,31.64 },
			{ 287.24,6454.22,31.54 },
			{ 269.85,6452.66,31.66 },
			{ 274.09,6452.83,31.68 },
			{ 278.62,6453.28,31.66 },
			{ 282.0,6453.59,31.64 },
			{ 285.88,6453.91,31.58 },
			{ 270.91,6448.71,31.85 },
			{ 275.6,6449.4,31.81 },
			{ 279.49,6449.37,31.83 },
			{ 283.59,6449.74,31.8 },
			{ 286.71,6450.0,31.81 },
			{ 270.68,6446.76,31.85 },
			{ 273.33,6446.93,31.86 },
			{ 277.85,6447.26,31.91 },
			{ 281.12,6447.46,31.93 },
			{ 284.92,6447.82,31.88 },
			{ 287.45,6448.11,31.91 }
		},
		["deliveryItem"] = "carrot"
	},
	
	-----------------------------------------------------------
	
	["Motorista"] = {
		["coords"] = { 453.05,-607.72,28.59 },
		["upgradeStress"] = 1,
		["routeCollect"] = true,
		["routeDelivery"] = false,
		["collectVehicle"] = -713569950,
		["usingVehicle"] = true,
		["collectRandom"] = false,
		["collectText"] = "PEGAR",
		["deliveryText"] = "ENTREGAR",
		["collectButtonDistance"] = 15,
		["collectShowDistance"] = 100,
		["collectConsume"] = {
			["min"] = 40,
			["max"] = 45
		},
		["collectCoords"] = {
			{ 418.92,-571.03,28.68 },
			{ 923.78,186.7,75.81 },
			{ 1644.11,1166.89,84.26 },
			{ 2104.23,2630.44,51.76 },
			{ 2402.38,2918.04,49.31 },
			{ 1786.57,3356.21,40.51 },
			{ 1620.82,3813.85,34.94 },
			{ 1911.6,3793.09,32.31 },
			{ 2493.37,4088.69,38.04 },
			{ 2068.51,4693.82,41.19 },
			{ 1676.39,4822.41,42.02 },
			{ 2250.19,4986.36,42.23 },
			{ 1667.97,6397.56,30.12 },
			{ 235.51,6574.7,31.57 },
			{ -85.11,6584.3,29.47 },
			{ -137.53,6440.85,31.42 },
			{ -235.39,6304.34,31.39 },
			{ -422.67,6031.56,31.34 },
			{ -756.66,5515.02,35.49 },
			{ -1538.42,4976.01,62.28 },
			{ -2246.9,4283.26,46.68 },
			{ -2731.13,2292.23,19.05 },
			{ -3233.06,1009.3,12.18 },
			{ -3002.44,416.76,14.97 },
			{ -1960.25,-504.23,11.82 },
			{ -1371.7,-982.24,8.43 },
			{ -1166.92,-1471.31,4.34 },
			{ -1052.56,-1511.78,5.09 },
			{ -900.75,-1206.71,4.94 },
			{ -628.94,-924.13,23.28 },
			{ -557.24,-845.49,27.61 },
			{ -1059.11,-2066.85,13.2 },
			{ -543.79,-2194.84,6.01 },
			{ -60.68,-1806.51,27.21 },
			{ 228.64,-1837.9,26.73 },
			{ 291.46,-2002.07,20.31 },
			{ 739.81,-2233.34,29.24 },
			{ 1045.03,-2384.93,30.28 },
			{ 1200.9,-685.64,60.6 },
			{ 954.37,-146.43,74.45 },
			{ 566.42,218.64,102.54 },
			{ -429.1,252.36,83.02 },
			{ -732.3,3.21,37.88 },
			{ -1244.38,-302.64,37.32 },
			{ -1403.93,-566.3,30.22 },
			{ -1202.05,-876.7,13.28 },
			{ -691.37,-961.63,19.79 },
			{ -387.71,-851.57,31.5 },
			{ 149.9,-1028.06,29.25 },
			{ 120.26,-1356.98,29.19 },
			{ 118.29,-785.88,31.3 },
			{ 98.34,-628.98,31.57 }
		},
		["deliveryItem"] = "dollars"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local collectAmount = {}
local paymentAmount = {}
local deliveryAmount = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COLLECTCONSUME
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.collectConsume(serviceName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if works[serviceName]["collectRandom"] then
			local amountItem = 0
			local selectItem = ""

			if serviceName == "Minerador" then
				local randomItem = math.random(100)

				if randomItem <= 1 then
					amountItem = 1
					selectItem = "emerald"
				elseif randomItem >= 2 and randomItem <= 3 then
					selectItem = "diamond"
					amountItem = math.random(2)
				elseif randomItem >= 4 and randomItem <= 8 then
					selectItem = "ruby"
					amountItem = math.random(2)
				elseif randomItem >= 9 and randomItem <= 16 then
					selectItem = "sapphire"
					amountItem = math.random(3)
				elseif randomItem >= 17 and randomItem <= 27 then
					selectItem = "amethyst"
					amountItem = math.random(3)
				elseif randomItem >= 28 and randomItem <= 44 then
					selectItem = "amber"
					amountItem = math.random(3)
				elseif randomItem >= 45 and randomItem <= 60 then
					selectItem = "turquoise"
					amountItem = math.random(3)
				elseif randomItem >= 61 and randomItem <= 79 then
					selectItem = "aluminum"
					amountItem = math.random(2)
				elseif randomItem >= 80 then
					selectItem = "copper"
					amountItem = math.random(2)
				end
			else
				local randomItem = math.random(#works[serviceName]["deliveryItem"])
				selectItem = works[serviceName]["deliveryItem"][randomItem]
				amountItem = math.random(works[serviceName]["collectConsume"]["min"],works[serviceName]["collectConsume"]["max"])
			end

			if (vRP.inventoryWeight(user_id) + (itemWeight(selectItem) * parseInt(amountItem))) <= vRP.getWeight(user_id) then
				vRP.generateItem(user_id,selectItem,amountItem,true)

				if works[serviceName]["upgradeStress"] > 0 then
					vRP.upgradeStress(user_id,works[serviceName]["upgradeStress"])
				end

				return true
			else
				TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			end
		else
			local deliveryItem = works[serviceName]["deliveryItem"]
			collectAmount[user_id] = math.random(works[serviceName]["collectConsume"]["min"],works[serviceName]["collectConsume"]["max"])

			if (vRP.inventoryWeight(user_id) + (itemWeight(deliveryItem) * parseInt(collectAmount[user_id]))) <= vRP.getWeight(user_id) then
				vRP.generateItem(user_id,deliveryItem,collectAmount[user_id],true)

				if deliveryItem == "dollars" then
					if vRP.userPremium(user_id) then
						vRP.generateItem(user_id,deliveryItem,collectAmount[user_id] * 0.10,true)
					end
				end

				if works[serviceName]["upgradeStress"] > 0 then
					vRP.upgradeStress(user_id,works[serviceName]["upgradeStress"])
				end

				collectAmount[user_id] = nil

				return true
			else
				TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVERYCONSUME
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deliveryConsume(serviceName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local deliveryItem = works[serviceName]["deliveryPayment"]["item"]
		deliveryAmount[user_id] = math.random(works[serviceName]["deliveryConsume"]["min"],works[serviceName]["deliveryConsume"]["max"])
		paymentAmount[user_id] = math.random(works[serviceName]["deliveryPayment"]["min"],works[serviceName]["deliveryPayment"]["max"])

		if (vRP.inventoryWeight(user_id) + (itemWeight(deliveryItem) * parseInt(paymentAmount[user_id]))) <= vRP.getWeight(user_id) then
			if vRP.tryGetInventoryItem(user_id,works[serviceName]["deliveryItem"],deliveryAmount[user_id]) then
				local paymentPrice = parseInt(paymentAmount[user_id] * deliveryAmount[user_id])

				vRP.generateItem(user_id,deliveryItem,paymentPrice,true)

				if deliveryItem == "dollars" then
					if vRP.userPremium(user_id) then
						vRP.generateItem(user_id,deliveryItem,paymentPrice * 0.10,true)
					end
				end

				deliveryAmount[user_id] = nil
				paymentAmount[user_id] = nil

				if works[serviceName]["upgradeStress"] > 0 then
					vRP.upgradeStress(user_id,works[serviceName]["upgradeStress"])
				end

				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>"..parseFormat(deliveryAmount[user_id]).."x "..itemName(works[serviceName]["deliveryItem"]).."</b> para entregar.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkPermission(serviceName)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if works[serviceName]["perm"] == nil then
			return true
		end

		if vRP.hasGroup(user_id,works[serviceName]["perm"]) then
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerConnect",function(user_id,source)
	vCLIENT.updateWorks(source,works)
end)