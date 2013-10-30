// deploy_camo.sqf
// norrin, MARCH 2013
private ["_vcl","_pos_vcl","_dir_vcl","_tent"]; 
_vcl 				= _this select 0;
_pos_vcl 			= getPosATL _vcl;
_dir_vcl 			= getDir _vcl;
norrn_mob_mash		= objNull;
_tent				= "Land_FirePlace_F";
norrn_mob_mash = _tent createVehicle _pos_vcl;
publicVariable "norrn_mob_mash";
norrn_mob_mash setDir (_dir_vcl + 90);
norrn_mob_mash setPos [(_pos_vcl select 0) + (sqrt (4) * cos (155 - _dir_vcl)), (_pos_vcl select 1) + (sqrt (4) * sin (155 - _dir_vcl)) , 0];
NORRN_camo_net = true;
publicVariable "NORRN_camo_net";
_vcl removeAction NORRN_l_spawn_act;



