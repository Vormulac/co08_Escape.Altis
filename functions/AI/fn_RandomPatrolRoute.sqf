if (!isServer) exitWith {};

private ["_group", "_markerName", "_debug"];
private ["_currentPos", "_destinationPos", "_time", "_leader"];

_group = _this select 0;
_markerName = _this select 1;
_debug = _this select 2;

while {true} do {
	_leader = (leader _group);
	_currentPos = getPos _leader;
	_destinationPos = ["_markerName"] call fn_rnd_marker_pos;

	//commandMove because groupMove makes a waypoint
	_leader commandMove _destinationPos;

	//IIRC walking speed is 101 m/min (this may be from Arma 2)?
	_time = ((_currentPos distance _destinationPos) / 101) * 60;

	sleep _time;

};
