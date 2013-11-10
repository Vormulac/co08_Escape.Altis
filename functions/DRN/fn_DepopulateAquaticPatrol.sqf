if (!isServer) exitWith {};

private ["_village", "_markerName", "_debug", "_soldiers", "_soldier", "_spawned", "_damage", "_soldierObj"];
private ["_groups", "_soldierPos", "_group", "_hasScript", "_boats"];
private ["_deleteGroupDelayed"];

_village = _this select 0;
if (count _this > 1) then {_debug = _this select 1;} else {_debug = false;};

_markerName = _village select 0;
_groups = _village select 2;
_boats = _village select 3;

if (_debug) then {
    player sideChat "Depopulating aquatic Patrol (" + _markerName + ")";
};

_deleteBoatDelayed = {
    private ["_boat","_group"];
    _boat = _this select 0;
    _group = group (leader ((crew _boat) select 0));
    {
        deleteVehicle _x;
    } foreach crew _boat;
	_script = _group getvariable ["A3E_GroupPatrolScript",nil];
	if(!isNil("_script")) then {
		if (!(scriptDone _script)) then {
			terminate _script;
		};
	};
    deleteGroup _group;
    deleteVehicle _boat;
};

{
	_boat = _x;
	    
    (_boat) spawn _deleteBoatDelayed;
    sleep 0.5;
} foreach _boats;



