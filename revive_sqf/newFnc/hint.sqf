// hint.sqf
// norrin - MAY 2013
private ["_array","_unit","_wounded"];
_array   = _this select 0;
_unit    = _array select 0;
_wounded = _array select 1;
_message = _array select 2;
if (local _unit) then {
 if(_message == 0) then {
	call compile format ["hint '%1 has called for help \nCheck map if markers are enabled for wounded players position'", name _wounded];
};
	