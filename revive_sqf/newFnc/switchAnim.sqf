// switchAnim.sqf
// norrin - MAY 2013
private ["_array","_unit","_anim"];
_array  = _this select 0;
_unit   = _array select 0;
_anim	= _array select 1;
_unit switchMove _anim; 