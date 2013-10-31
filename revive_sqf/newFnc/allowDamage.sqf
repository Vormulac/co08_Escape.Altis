// allowDamage.sqf
// MAY, 2013 - norrin
private ["_array","_unit"];
_array = _this select 0;
_unit  = _array select 0;
_unit allowDamage true; 
_unit setCaptive false;

