// stow_camo.sqf
// norrin, March 2013
private ["_vcl","_pos_vcl","_dir_vcl"]; 
_vcl 		= _this select 0;
_pos_vcl 	= getPos _vcl;
_dir_vcl 	= getDir _vcl;
deleteVehicle norrn_mob_mash;
norrn_mob_mash = objNull;
NORRN_camo_net = false;
publicVariable "NORRN_camo_net";
NORRN_camo_reset = true;
publicVariable "NORRN_camo_reset";
_vcl removeAction NORRN_l_remove_spawn_act;