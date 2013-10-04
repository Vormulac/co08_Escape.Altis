if (!isServer) exitWith {};

private ["_locationObject", "_side", "_maxGroupsCount", "_debug"];
private ["_markerName", "_soldierObjects", "_skill", "_soldierType", "_spawned", "_damage", "_group"];
private ["_script", "_groupMemberCount", "_fortify", "_noFollow", "_locationPos", "_maxGroupSize"];
private ["_spawnPos", "_firstGroup"];

_locationObject = _this select 0;
_side = _this select 1;
_maxGroupsCount = _this select 2;
if (count _this > 3) then {_debug = _this select 3;} else {_debug = false;};

_markerName = _locationObject select 0;
_soldierObjects = _locationObject select 2;
_locationPos = _locationObject select 3;

_maxGroupSize = ceil ((count _soldierObjects) / _maxGroupsCount);

if (_debug) then {
    player sideChat "Populating location '" + _markerName + "'";
};

_groupMemberCount = _maxGroupSize;
_fortify = "";
_noFollow = "noFollow";
_firstGroup = true;

{
    private ["_soldierObject", "_soldier"];
	_soldierObject = _x;

	_soldierType = _soldierObject select 0;
	_skill = _soldierObject select 1;
	_spawned = _soldierObject select 2;
	_damage = _soldierObject select 3;

    if ((!_spawned) && _damage < 0.75) then {
        if (_groupMemberCount >= _maxGroupSize) then {
            if (!_firstGroup) then {
                sleep 1;
            };
            
            _group = createGroup _side;
            _groupMemberCount = 0;
            _firstGroup = false;
            
            _spawnPos = [_markerName] call drn_fnc_CL_GetRandomMarkerPos;
        };
        
        _markerName setMarkerPos _locationPos; // upsmon moves this away for some reason, so we need to reset it
        
        _soldier = _group createUnit [_soldierType, _spawnPos, [], 0, "FORM"];
        //_soldier setSkill _skill;
		[_soldier, drn_var_Escape_enemyMinSkill] call EGG_EVO_skill;
        _soldier setDamage _damage;

		_soldier setVehicleAmmo (0.2 + random 0.6);
		_soldier unassignItem "ItemGPS";
		_soldier unassignItem "ItemMap";
		_soldier unassignItem "ItemCompass";
		_soldier unassignItem "NVGoggles_OPFOR";
		_soldier removeItem "ItemGPS";
		_soldier removeItem "ItemMap";
		_soldier removeItem "ItemCompass";
		_soldier removeItem "NVGoggles_OPFOR";
		_soldier removeItem "FirstAidKit";
		if(random 100 < 70) then {
			_soldier removePrimaryWeaponItem "optic_Aco";
			_soldier removePrimaryWeaponItem "optic_ACO_grn";
			_soldier removePrimaryWeaponItem "optic_Hamr";
			_soldier removePrimaryWeaponItem "optic_Holosight";
			_soldier removePrimaryWeaponItem "optic_Arco";
			_soldier removePrimaryWeaponItem "optic_MRCO";
			_soldier removePrimaryWeaponItem "optic_SOS";
		};
		
		if (random 100 < 30) then {
			_soldier addItem "ItemMap";
			_soldier assignItem "ItemMap";
		};
		if (random 100 < 30) then {
			_soldier addItem "ItemCompass";
			_soldier assignItem "ItemCompass";
		};
		if (random 100 < 25) then {
			if (!(_soldier hasWeapon "NVGoggles_OPFOR")) then {
				_soldier addItem "NVGoggles_OPFOR";
				_soldier assignItem "NVGoggles_OPFOR";
			};
		};
		
        if (_groupMemberCount == 0) then {
			_soldier setUnitRank "SEARGENT";
            _script = [_soldier, _markerName, "spawned", "NOFOLLOW", "NOWAIT", "FORTIFY"] execVM "Scripts\upsmon.sqf";
            _soldierObject set [5, _script];
            _soldierObject set [6, true];
        };

		_soldierObject set [2, true];
		_soldierObject set [4, _soldier];

		_groupMemberCount = _groupMemberCount + 1;
	};

    //sleep 0.25;
} foreach _soldierObjects;

