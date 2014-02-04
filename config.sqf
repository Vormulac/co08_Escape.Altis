//Loading world specific configs
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\WorldConfig.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\VillageMarkers.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\PatrolBoatMarkers.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\CommunicationCenterMarkers.sqf");

A3E_Debug = true; //Can be overwritten by parameters

//Settings


//GlobalVariables (NO SETTINGS)
A3E_Players = []; //A list of the connected players
A3E_StartPos = [];  //The Startposition
A3E_HC_ID = 0;
