//A3E_fnc_RunExtraction

private ["_extractionPointNo"];
private ["_spawnMarkerName", "_extractionMarkerName", "_extractionMarkerName2", "_result", "_boat1", "_boat2", "_group1", "_group2", "_waypoint"];
["Running extraction."] spawn a3e_fnc_debugChat;
_extractionIndex = _this select 0;
_extractionPointNameA = A3E_ExtractionPointsA select _extractionIndex;
_extractionPointNameB = A3E_ExtractionPointsB select _extractionIndex;
_posA = getMarkerPos _extractionPointNameA;
_posB = getMarkerPos _extractionPointNameB;

_land1 = A3E_HelperObject createvehicle _posA;
_land2 = A3E_HelperObject createvehicle _posB;


_extractionPosition = _posA;


_centre = getPos center;

_delta = [(_extractionPosition select 0) - (_centre select 0), (_extractionPosition select 1) - (_centre select 1), 0];
_spawnPosition = [(_extractionPosition select 0) + (_delta select 0)/5, (_extractionPosition select 1) + (_delta select 1)/5, 0];
_result = [[(_spawnPosition select 0) + 25, (_spawnPosition select 1) + 20, 100], 0, "B_Heli_Transport_01_F", west] call BIS_fnc_spawnVehicle;
_boat1 = _result select 0;
_group1 = _result select 2;

_result = [[(_spawnPosition select 0) - 25, (_spawnPosition select 1) - 20, 100], 0, "B_Heli_Transport_01_F", west] call BIS_fnc_spawnVehicle;
_boat2 = _result select 0;
_group2 = _result select 2;
//(units _group2) join _group1;

_waypoint = _group1 addWaypoint [_posA, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "STEALTH";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", "vehicle this land 'LAND'"];

_waypoint = _group2 addWaypoint [_posB, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "STEALTH";
_waypoint setWaypointFormation "WEDGE";
_waypoint setWaypointStatements ["true", "vehicle this land 'LAND'"];


_boat1 flyinheight 30;
_boat2 flyinheight 30;


// Verkar inte funka...
//(driver _boat1) action ["LightOff", _boat1];
//(driver _boat2) action ["LightOff", _boat2];

if (isMultiplayer) then {
    waitUntil {{vehicle _x == _boat1 || vehicle _x == _boat2} count ([] call A3E_fnc_GetPlayers) == count ([] call A3E_fnc_GetPlayers)};
}
else {
    waitUntil {
    	(((vehicle player) == _boat1) || ((vehicle player) == _boat2))
    };
};

_boat1 land "NONE";
_boat2 land "NONE";

_exfilPoint =  [(_extractionPosition select 0) + (_delta select 0)*5, (_extractionPosition select 1) + (_delta select 1)*5, 0];

_waypoint = _group1 addWaypoint [_exfilPoint, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

_waypoint = _group2 addWaypoint [_exfilPoint, 0];
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";

//sleep 10;

//["Task complete: Rendesvouz with allied forces."] call drn_fnc_CL_ShowTitleTextAllClients;

//sleep 25;

//["drn_rendesvouzTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
//drn_var_Escape_MissionComplete = true;
//publicVariable "drn_var_Escape_MissionComplete";

