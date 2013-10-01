if (!isServer) exitWith {};

private ["_vehicle", "_firstDestinationPos", "_debug"];
private ["_speed", "_roadSegments", "_destinationSegment"];
private ["_destinationPos"];
private ["_waypoint", "_fuel"];

_vehicle = _this select 0;
if (count _this > 1) then {_firstDestinationPos = _this select 1;} else {_firstDestinationPos = [];};
if (count _this > 2) then {_debug = _this select 2;} else {_debug = false;};

/*
if (count _firstDestinationPos > 0) then {
    sleep random 30;
};
*/

// Set fuel to something in between 0.5 and 0.9.
_fuel = 0.2 + random (0.9 - 0.2);
_vehicle setFuel _fuel;

if (count _firstDestinationPos > 0) then {
    _destinationPos = + _firstDestinationPos;
}
else {
    _trafficLocation = floor random 8;
	switch (_trafficLocation) do {
		case 0: { _roadSegments = (getMarkerPos "TrafficMarker_SouthWest") nearRoads 300; };
		case 1: { _roadSegments = (getMarkerPos "TrafficMarker_NorthWest") nearRoads 300; };
		case 2: { _roadSegments = (getMarkerPos "TrafficMarker_NorthEast") nearRoads 300; };
		case 3: { _roadSegments = (getMarkerPos "TrafficMarker_SouthEast") nearRoads 300; };
		case 4: { _roadSegments = (getMarkerPos "TrafficMarker_North") nearRoads 300; };
		case 5: { _roadSegments = (getMarkerPos "TrafficMarker_East") nearRoads 300; };
		case 6: { _roadSegments = (getMarkerPos "TrafficMarker_South") nearRoads 300; };
		case 7: { _roadSegments = (getMarkerPos "TrafficMarker_West") nearRoads 300; };
		//default { _roadSegments = drn_allroadSegments };
	};
    _destinationSegment = _roadSegments select floor random count _roadSegments;
    _destinationPos = getPos _destinationSegment;
};

_speed = "NORMAL";
if (_vehicle distance _destinationSegment < 500) then {
    _speed = "LIMITED";
};

_waypoint = group _vehicle addWaypoint [_destinationPos, 10];
_waypoint setWaypointBehaviour "CAreleSS";
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointCompletionRadius 10;
_waypoint setWaypointStatements ["true", "_nil = [" + vehicleVarName _vehicle + ", [], " + str _debug + "] execVM ""Scripts\DRN\MilitaryTraffic\MoveVehicle.sqf"";"];


