// mobileRespawn.sqf
// MAY 2013 - norrin
private ["_vcl"];
_array = _this select 0;
_vcl   = _array select 0;
_vcl setVehicleVarName 'r_mobile_spawn_vcl';
_vcl addEventHandler ["GETIN",{if ((_this select 1) == "driver") then {NORRN_landy_script = [_this select 0, _this select 2] execVM "revive_sqf\mobile\mobile_spawn.sqf"}}];
_vcl lock false;
_vcl setVehicleLock "UNLOCKED";
