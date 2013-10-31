// returnLoadOut.sqf
// norrin, OCTOBER 2013
// Many thanks to [KH]Jman 04/03/2013 for the additional code required to make this work properly!
private ["_unit","_assItems","_allItems","_primWep","_primWepI","_handgun","_handgunI","_secWep","_secWepI","_unif","_unifI","_vest","_vestI","_bckpck","_bckpckI","_headgear","_goggles","_no","_x","_unpack","_repack","_chkAmmo","_addPrim","_addWep","_mag","_ammo","_backPack"];
_unit 		= _this select 0;
_assItems	= _this select 1;
_allItems	= _this select 2;
_primWep	= _allItems select 0;
_primWepI	= _allItems select 1;
_handgun	= _allItems select 2;
_handgunI	= _allItems select 3;
_secWep		= _allItems select 4;
_secWepI	= _allItems select 5;
_unif		= _allItems select 6;
_unifI		= _allItems select 7;
_vest		= _allItems select 8;
_vestI		= _allItems select 9;
_bckpck		= _allItems select 10;
_bckpckI	= _allItems select 11;
_headgear	= _allItems select 12;
_goggles	= _allItems select 13;
_cWeapon	= _allItems select 14;
_cMag		= _allItems select 15;
_ammoW		= _allItems select 16;
_muzzle		= _allItems select 17;
_ammoM		= _allItems select 18;
_backPack	= objNull;
// Remove all items on respawned avatar
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeHeadgear _unit;
removeGoggles _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
// Fnc
_unpack = 	{if(isClass(configFile>>"CfgMagazines">>_x)) then {
				_unit removeMagazine _x;
			} else {
				if (isClass(configFile>>"CfgWeapons">>_x>>"WeaponSlotsInfo") && getNumber(configFile>>"CfgWeapons">>_x>>"showempty")==1) then {
					_unit removeWeapon _x;
				} else {
					_unit removeItem _x
				};
			};
		};
_repack = 	{if (isClass(configFile>>"CfgMagazines">>_x)) then {
				_unit addMagazine _x;
			} else {
				if (isClass(configFile>>"CfgWeapons">>_x>>"WeaponSlotsInfo") && getNumber(configFile>>"CfgWeapons">>_x>>"showempty")==1) then {
					_unit addWeapon _x;					
				} else {
					_unit addItem _x;
				};
			};
		};
_chkMag  = {
	_mag 	= getArray(configFile>>"CfgWeapons">>(_this select 0)>>"magazines") select 0;
	_mag
};
_chkAmmo = {
	_ammo   = getNumber(configFile>>"CfgMagazines">>(_this select 0)>>"count");
	_ammo
};
_addPrim =  {
	if (_primWep != "") then {
		private ["_mag","_ammo"];
		if (_primWep == _cWeapon && _cWeapon != _muzzle) then {
			_mag  = [_primWep] call _chkMag;
			_ammo = [_mag] call _chkAmmo;
			if (_ammoW > _ammo) then {_ammoW = _ammo};
			if (_ammoW != 0) then {_unit addMagazine [_mag, _ammoW]};
			if (_ammoM != 0) then {_unit addMagazine [_cMag,_ammoM]};
		};
		if (_primWep == _cWeapon && _cWeapon == _muzzle) then {
			if(_ammoW != 0) then {_unit addMagazine [_cMag,_ammoW]};
			_muzzles = getArray(configFile>>"CfgWeapons">>_primWep>>"muzzles");
			{if (_x != "this") then {
				_mag = getArray(configFile>>"CfgWeapons">>_primWep>>_x>>"magazines") select 0;
				_unit addMagazine _mag; 
			}} forEach _muzzles;
		};
		if (_primWep != _cWeapon) then {
			_mag  = [_primWep] call _chkMag;
			_ammo = [_mag] call _chkAmmo;
			_unit addMagazine [_mag,_ammo];
			_muzzles = getArray(configFile>>"CfgWeapons">>_primWep>>"muzzles");
			{if (_x != "this") then {
				_mag = getArray(configFile>>"CfgWeapons">>_primWep>>_x>>"magazines") select 0;
				_unit addMagazine _mag; 
			}} forEach _muzzles;
		};
		_unit addWeapon _primWep;
		if (count(primaryWeaponItems _unit) > 0) then {{if (_x != "") then {_unit removePrimaryWeaponItem _x}} forEach (primaryWeaponItems _unit)};
		if (count _primWepI > 0) then {{if (_x != "") then {_unit addPrimaryWeaponItem _x}} forEach _primWepI}; 
	};
};
_addWep = {
	private ["_wep","_mag","_ammo"];
	_wep = _this select 0;
	if (_wep != "") then {
		if (_wep == _cWeapon) then {
			if(_ammoW != 0) then {_unit addMagazine [_cMag,_ammoW]};
		} else {
			_mag  = [_wep] call _chkMag;
			_ammo = [_mag] call _chkAmmo;
			_unit addMagazine [_mag,_ammo];
		};	
		_unit addWeapon _wep;
		if (_wep == _handgun) then {
			{if(_x != "") then {_target addHandgunItem _x}} forEach (_this select 1);
		} else {
			{if(_x != "") then {_target addSecondaryWeaponItem _x}} forEach (_this select 1);
		};
	};
};
// Add temporary backPack;
_unit addBackpack "B_AssaultPack_blk";
// Re-add uniform
if (_unif != "")  then {_unit addUniform _unif};
{call _unpack} forEach uniformItems _unit;
// Re-add primary weapon
call _addPrim;
// Re-add handgun
[_handgun, _handgunI] call _addWep;
// Re-add secondary weapon
[_secWep, _secWepI] call _addWep;
// Re-add uniform items
if (count _unifI > 0) then {{call _repack} forEach _unifI};
// Re-add vest
if (_vest != "")  then {_unit addVest _vest};
{call _unpack} forEach vestItems _unit;
// Re-add vest items
if (count _vestI > 0) then {{call _repack} forEach _vestI};
// Re-add headgear
if (_headgear != "")  then {_unit addHeadgear _headgear};
// Re-add goggles
if (_goggles != "")  then {_unit addGoggles _goggles};
// Remove temp backpack
removeBackpack _unit;
// Re-add backpack
if (_bckpck != "")  then {
	_unit addBackpack _bckpck;
	_backPack = unitBackpack _unit; 
	clearAllItemsFromBackpack _unit;
};
// Re-add backpack items
if (count _bckpckI > 0) then {{
	if(isClass(configFile>>"CfgMagazines">>_x)) then {
		_backPack addMagazineCargo [_x,1];
	} else {
		if(getNumber(configFile>>"CfgVehicles">>_x>>"isbackpack")==1) then {
			_backPack addBackpackCargo [_x,1];
		} else {
			if(isClass(configFile>>"CfgWeapons">>_x>>"WeaponSlotsInfo")&&getNumber(configFile>>"CfgWeapons">>_x>>"showempty")==1) then {
				_backPack addWeaponCargo [_x,1];  
			} else {
				_backPack addItemCargo [_x,1];        
			};
		};
	};
}forEach _bckpckI};
if (count _assItems > 0) then {{if(isClass(configFile>>"CfgWeapons">>_x>>"WeaponSlotsInfo") && getText(configFile>>"CfgWeapons">>_x>>"simulation") != "NVGoggles") then {
	_unit addWeapon _x; _unit assignItem _x;
} else {_unit addItem _x; _unit assignItem _x}} forEach _assItems};
// switch to current weapon
_unit selectWeapon _muzzle; 




