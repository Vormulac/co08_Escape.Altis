call compile preprocessFile "Revive\reviveFunctions.sqf";

AT_Revive_Debug = true;
[] spawn
{
    waitUntil {!isNull player};
	
	[] spawn AT_FNC_Revive_InitPlayer;
	
	
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[] spawn AT_FNC_Revive_InitPlayer;
		}
	];
};


if (!AT_Revive_Debug || isMultiplayer) exitWith {};

{
	if (!isPlayer _x) then 
	{
		_x addEventHandler ["HandleDamage", AT_FNC_Revive_HandleDamage];
		_x setVariable ["AT_Revive_isUnconscious", false, true];
		_x setVariable ["AT_Revive_isDragged", objNull, true];
		_x setVariable ["AT_Revive_isDragging", objNull, true];
	};
} forEach switchableUnits;