//a3e_fn_buildRoadblock
private["_marker","_logic","_randomPosInRegion","_road", "_roadblock", "_distance"];
_marker = [_this, 0, "noMarker"] call BIS_fnc_param;
_logic = [_this, 1,objNull] call BIS_fnc_param;

_randomPosInRegion = [_marker] call a3e_fnc_RandomMarkerPos;
_road = [_randomPosInRegion, A3E_RegionSize, []] call BIS_fnc_nearestRoad;

_roadblock = [];

if(_road != objNull) then {
	//spawn roadblock
	_distance = [position _road, getMarkerPos _marker] call BIS_fnc_distance2Dsqr;
  	if(_distance < (A3E_RegionSize * A3E_RegionSize)) then {
  		
  		_roadblock = [position _road] call a3e_fnc_BasicRoadblock;
	};

};

_logic setvariable ["A3E_Roadblock",_roadblock,true];
