// playAnim.sqf
// MAY 2013 - norrin
private ["_array","_unit","_anim"];
_array  = _this select 0;
_unit   = _array select 0;
_anim	= _array select 1;
if (local _unit) then {_unit playMove _anim}; 