// detach.sqf
// norrin, MAY 2013
private ["_array","_unit"];
_array   = _this select 0;
_unit    = _array select 0;
_carrier = _array select 1;
_pos     = _array select 2; 
detach _unit;