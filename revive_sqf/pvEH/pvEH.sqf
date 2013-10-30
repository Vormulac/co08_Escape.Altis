// pvEH.sqf
// norrin - MAY 2013
private ["_passedVar","_fnc","_array"];
_passedVar  = _this select 0;
_fnc		= _passedVar select 0;
_array 	 	= _passedVar select 1; 
[_array] call _fnc;
