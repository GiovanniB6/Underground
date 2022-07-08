

Config = {}
--[[

THERE IS A COUPLE VARIABLES AT THE TOP OF THE .CSS FOR THE STANCER , 
YOU CAN EASILY CHANGE THE BACKGROUND AND ITS START UP LOCATION HERE ALSO YOU CAN CHANGE WHERE THE PRESS E PROMPT SHOWS.


 Thanks for your support. to set up the script is very simple. in around 10 short steps and you should be up and running

 The only dependency the script has is 'mysql-async' how ever if you using qb and oxmysql you can set that up to work with it also.

 now when using the frameworks making sure to only set one to true setting a framework your not on true will cause the script to break!



 a simple guide on how the script works...

 you set a location to where anybody or a selected job role can use the script once your in this location and you get out the vehicle you want to tune. 
 when you walk upto any of the cars wheels you will get a prompt E html pop up for you to press when you press e the stancer will open.

 now from the start the stancer will start on mode 1 . you can change modes by clicking the image in the bottom left
 Mode 1:
 any wheel you walk upto you can change the camber and offset indpendantly

 Mode 2:
 the stancer will select the 2 wheels from the front or back depending where your standing.

 Mode 3: 
 allows you to change all 4 wheels at once


 the image on the bottom right allows you to move the stancer where you want. allthough after you leave and rejoin it will go back to its original location

 make sure to click SAVE otherwise it will not store the data and sync it 

 ********************************************* ********************************************* ********************************************* *********************************************
  To speed up things and keep your tuning table tidy we run an sql command that removes all vehicles that are not owned by players that got tuned on previous restart
    as you will never see the vehicles again so we highly advise keeping this set to true! Config.deleteUnownedVehicleTunes = true

 **// unfortunatly due to way gta is made put your wheels below -15 camber to the max say -25 , 
  can cause some weird things to happen at high speeds we advise only going so high camber for show cars 
  vstancer would cap out at around -14(deg) camber on our stancer. so we have given nearly double that for that show stance,
  unfortunaltly we cannot go anymore the car becomes undriveable **//

  IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT IMPORTANT
    ********************************************* ********************************************* ********************************************* *********************************************
  INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE INSTALL GUIDE                                            
 
  ********************************************* ********************************************* ********************************************* *********************************************
 ESX.
 1. Add sql to your database
 2. Set Config.useESX = true,
 3. If you want to lock the stancer to a job role you can!, Simply type the job role into Config.JobRole and then set Config.restrictToESXJob = true
 4. If you want to use owned vehicles the script should be set up to work with standard esx tables so you should not need to change them, but we recommend you double check it against your database
 5. Once doing so you can set Config.UseOwnedVehicles = true
 6. Now set up your garage locations (this is the locations where it will give you the prompt press e to tune / if you want to use everywhere set coords to middle map and radius 10000
 7. Add wizating_stancer to your server.cfg 
 8. Start server 

 VRP.

 1. Add sql to your database
 2. switch out the fxmanifest for the vrp manifest from the manifests folder
 3. Set Config.useVRP = true,
 4. If you want to lock the stancer to a job role you can!, Simply type the job role into Config.JobRole and then set Config.restrictToVRPJob = true
 5. If you want to use owned vehicles the standard table and column for vrp would be  Config.ownedVehicles = 'vrp_user_vehicles' , Config.vehiclePlate = 'vehicle_plate' but we recommend you double check it against your database
 6. Once doing so you can set Config.UseOwnedVehicles = true
 7. Now set up your garage locations (this is the locations where it will give you the prompt press e to tune / if you want to use everywhere set coords to middle map and radius 10000
 8. Add wizating_stancer to your server.cfg 
 9. Start server 

 QB

 1. Add sql to your database
 2. switch out the fxmanifest for the qb manifest from the manifests folder
 3. Set Config.useQB = true,
 4. If you want to lock the stancer to a job role you can!, Simply type the job role into Config.JobRole and then set Config.restrictToQBJob = true
 5. If you want to use owned vehicles the standard table and column for vrp would be  Config.ownedVehicles = 'player_vehicles' , Config.vehiclePlate = 'plate' but we recommend you double check it against your database
 6. Once doing so you can set Config.UseOwnedVehicles = true
 7. Now set up your garage locations (this is the locations where it will give you the prompt press e to tune / if you want to use everywhere set coords to middle map and radius 10000
 8. Add wizating_stancer to your server.cfg 
 9. Start server 

 STANDALONE
 you can set the script to work on any framework by turning them all off , adding your vehicle tables for the owned vehicles.
 aslong as you have the mysql-async installed it can run on just a standard cfx server to a fully custom one

]]


------ MAKE SURE TO FOLLOW ALL STEPS IN THE INSTALL GUIDE FOR A HASSLE FREE SETUP! 


-- make sure you only set the framework you want to use or the script will break
Config.useESX = false
Config.useQB = false
Config.useVRP = false
Config.restrictToESXJob = false
Config.restrictToQBJob = false
Config.restrictToVRPJob = false
Config.JobRole = "mechanic"
Config.JobGrade = 2  ---- ANYBODY ABOVE THIS GRADE CAN USE THE SCRIPT (CURRENTLY ONLY WORKING ON ESX COMING TO OTHER FRAMEWORKS SOON)
Config.openStancerKey = 38
Config.showHTMLOPEN = '( E )'


Config.focusKey = 21 --- SHIFT you may want to change this if you plan on using tab to cycle the sliders as steam overlay will pop up.
Config.closeUiVehicleDistance = 4.0  ---- the max distance you can be before the stancer closes automatically.


Config.UseOwnedVehicles  = true -- change this to true if using owned vehicles and set up the tables to match your framework
Config.deleteUnownedVehicleTunes = false ---- keep this true if you want the script to automatically delete any data from vehicles that are not owned by players

------ SQL INFO CHANGE THESE TO MATCH YOURS -----
Config.ownedVehicles = 'summerz_vehicles' ----  CHANGE THIS TO MATCH YOUR FRAMEWORK / TABLE NAME OF OWNED VEHICLES
Config.vehiclePlate = 'plate' ---- CHANGE THIS TO MATCH YOUR FRAMEWORK / COLUMN NAME INSIDE OWNED VEHICLES FOR NUMBERPLATE

-------- this is the locations where you can use the stancer / if you want to use everywhere set coords to middle map and radius 10000
Config.garageLocations = {
 [1] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 10000} ----- THIS IS THE BIG AIRPORT HANGER WE ADVISE CHANGING THIS BEFORE START UP
 --[2] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 50}   
 --[3] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 100}   -- make sure if you add location the number goes in order 1 2 3 4 5 6 7 
 --[4] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 75}    -- you can add more then this these are just examples to give you an idea of the formant
 --[5] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 10}   
 --[6] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 25}   
 --[7] = {  coords = {x = -998.19, y = -3019.46, z = 13.95} , radius = 10000}   
}