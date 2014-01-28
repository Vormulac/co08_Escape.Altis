//waituntil{!isNil("BIS_fnc_init")};
if(!isServer) exitwith {};
diag_log("Server bootstrap invoked");

//Parse the parameters
call a3e_fnc_parameterInit;

[1] call compile preprocessFileLineNumbers "Scripts\Escape\UnitClasses.sqf";

A3E_StartPos = [] call a3e_fnc_findFlatArea;

// Build start position
_fenceRotateDir = random 360;
[A3E_StartPos, _fenceRotateDir] call a3e_fnc_BuildPrison;


// Add crashsite here
//##############

[] call A3E_fnc_createComCenters;
[] call A3E_fnc_createAmmoDepots;