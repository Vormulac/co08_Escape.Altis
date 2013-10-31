// noDamage.sqf
// MAY, 2013 - norrin
private ["_array","_unit"];
_array = _this select 0;
_unit  = _array select 0;
_unit switchMove "AinjPpneMstpSnonWnonDnon";
_unit allowDamage false; 
_unit setCaptive true;

