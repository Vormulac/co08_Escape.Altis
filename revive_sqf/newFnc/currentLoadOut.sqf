// currentLoadOut.sqf
// norrin, MAY 2013
private ["_unit","_primWep","_primWepI","_handgun","_handgunI","_secWep","_secWepI","_unif","_unifI","_vest","_vestI","_bckpck","_bckpckI","_headgear","_goggles","_cWeapon","_cMag","_ammoW","_muzzle","_ammoM","_allItems"];
_ammoM		= 0;
_unit 		= _this select 0;
_primWep 	= primaryWeapon _unit;
_primWepI	= primaryWeaponItems _unit;
_handgun 	= handgunWeapon _unit;
_handgunI 	= handgunItems _unit;
_secWep 	= secondaryWeapon _unit;
_secWepI 	= secondaryWeaponItems _unit;
_unif 		= uniform _unit;
_unifI 		= uniformItems _unit;
_vest 		= vest _unit;
_vestI 		= vestItems _unit;
_bckpck 	= backpack _unit; 
_bckpckI 	= backpackItems _unit;
_headgear 	= headgear _unit;
_goggles 	= goggles _unit;
_cWeapon	= currentWeapon _unit;
_cMag		= currentMagazine _unit;
_ammoW		= _unit ammo _cWeapon;
_muzzle 	= currentMuzzle _unit;
if (_cWeapon != "") then {_ammoM = _unit ammo _muzzle};
_allItems = [_primWep,_primWepI,_handgun,_handgunI,_secWep,_secWepI,_unif,_unifI,_vest,_vestI,_bckpck,_bckpckI,_headgear,_goggles,_cWeapon,_cMag,_ammoW,_muzzle,_ammoM];
_allItems;
