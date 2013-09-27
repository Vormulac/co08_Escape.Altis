FindRandomFlatArea = {
	private ["_centreX", "_centreY", "_rangeX", "_rangeY"];
	
	_isSuitable = false;
	_centreX = _this select 0;
	_centreY = _this select 1;
	_rangeX = _this select 2;
	_rangeY = _this select 3;
	_randPos = [_centreX, _centreY];
	_normal = surfaceNormal _randPos;
	
	while {!_isSuitable} do {
		_offsetX = (random (2 * _rangeX)) - _rangeX;
		_offsetY = (random (2 * _rangeY)) - _rangeY;
		_randPos = [_centreX + _offsetX, _centreY + _offsetY];
		_isLand = !surfaceIsWater _randPos;
		if(_isLand) then {
			_normal = surfaceNormal _randPos;
			_flatAndEmpty = count (_randPos isFlatEmpty [0, 0, 0.25, 1, 0, false, objNull]) > 0;
			_isNearRoad = (count (_randPos nearRoads 20)) != 0;
			_isNearBuilding = (nearestBuilding _randPos) distance _randPos < 20;
			_isSuitable = _isLand && _flatAndEmpty && !_isNearRoad && !_isNearBuilding;
		};
	};
	_randPos;
};

BuildPrison = {
	private ["_position"];
	_position = _this select 0;
	createVehicle ["Land_Metal_Shed_F",_position, [], 0, "NONE"];
};

GetPlayers = {
	players = [];
	if (!isNil "p1") then {
		if (isPlayer p1) then {
			players set [count players, p1];
		};
	};
	if (!isNil "p2") then {
		if (isPlayer p2) then {
			players set [count players, p2];
		};
	};
	if (!isNil "p3") then {
		if (isPlayer p3) then {
			players set [count players, p3];
		};
	};
	if (!isNil "p4") then {
		if (isPlayer p4) then {
			players set [count players, p4];
		};
	};
	if (!isNil "p5") then {
		if (isPlayer p5) then {
			players set [count players, p5];
		};
	};
	if (!isNil "p6") then {
		if (isPlayer p6) then {
			players set [count players, p6];
		};
	};
	if (!isNil "p7") then {
		if (isPlayer p7) then {
			players set [count players, p7];
		};
	};
	if (!isNil "p8") then {
		if (isPlayer p8) then {
			players set [count players, p8];
		};
	};

	players
};

StripInventory = {
	private ["_pc"];
	_pc = _this select 0;
	removeAllWeapons _pc;
	removeAllItems _pc;

	_pc unassignItem "itemmap";
	_pc unassignItem "itemcompass";
	_pc unassignItem "NVGoggles";
	_pc unassignItem "itemwatch";
	_pc unassignItem "itemgps";
	_pc unassignItem  "itemradio";
	
	_pc removeItem "itemmap";
	_pc removeItem "itemcompass";
	_pc removeItem "NVGoggles";
	_pc removeItem "itemwatch";
	_pc removeItem "itemgps";
	_pc removeItem "itemradio";
	_pc addItem "ACRE_PRC343";
	removeVest _pc;
	removeHeadgear _pc;
}