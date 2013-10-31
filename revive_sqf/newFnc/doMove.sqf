// doMove.sqf
// norrin - MAY 2013
private ["_array","_unit","_pos"];
_array   = _this select 0;
_unit    = _array select 0;
_pos	 = _array select 1;
if (local _unit) then {_unit doMove _pos};