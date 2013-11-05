//Don't do this! Will make HC compatibility a pain! We can rely on calling this function serverside only
//if (!isServer) exitWith {};

private ["_group", "_markerName", "_debug","_cityradius"];
private ["_in_combat","_knows_enemy","_currentPos", "_destinationPos", "_time", "_leader","_debugmarker1","_debugmarker2","_debugmarkername","_search_for_group","_reportedPositions"];

_group = _this select 0;
_markerName = _this select 1;
_debug = _this select 2;


if(_debug) then {
	_leader = (leader _group);
	_debugmarkername = format["Debugmarker1_Group_%1",_group];
	_debugmarker1 = createMarker [_debugmarkername,[0,0]];
	_debugmarkername = format["Debugmarker2_Group_%1",_group];
	_debugmarker2 = createMarker [_debugmarkername, [0,0]];
	_debugmarker1 setMarkerShape "ICON";
	_debugmarker1 setMarkerType "mil_dot";
	_debugmarker2 setMarkerShape "ICON";
	_debugmarker2 setMarkerType "mil_dot";
	_debugmarker1 setmarkertext format["Pos %1",_group];
	_debugmarker2 setmarkertext format["Aim %1",_group];
};
while {true} do {
	_leader = (leader _group);
	{
		if(alive _leader) exitwith {};
		_leader = _x;
	} foreach (units _group);
	
	_currentPos = getPos _leader;
	_in_combat = [_group] call A3E_fnc_InCombat;
	
	if(!_in_combat) then { 
		_reportedPositions = nearestObjects [getpos _leader, [a3e_var_knownPositionHelperObject], a3e_var_maxSearchRange];
		if(count(_reportedPositions)>0) then {
			_nearestPosition = (_reportedPositions select 0);
			{
				if((_x getvariable "A3E_LastUpdated")>(_nearestPosition getvariable "A3E_LastUpdated")) then {
					_nearestPosition = _x;
				};
			} foreach _reportedPositions;
			if(random 100 < a3e_var_investigationChance) then {
				if(isNil("_markerName")) then {
					if(_debug) then {
						player sidechat format["%1 is investigating the last known position",_group];
					};
					_handle = [_group,_nearestPosition,_debug] spawn a3e_fnc_EngageReportedGroup;
					waituntil{scriptDone _handle};
					if(_debug) then {
						player sidechat format["%1 is returning to patrol",_group];
					};
				} else {
					if(((getMarkersize _markerName) select 0)>((getMarkersize _markerName) select 1)) then {
						_cityradius = ((getMarkersize _markerName) select 0);
					} else {
						_cityradius = ((getMarkersize _markerName) select 1);
					};
					if((_leader distance _nearestPosition)<=_cityradius+(random _cityradius/2)) then {
						if(_debug) then {
							player sidechat format["%1 is investigating the last known position",_group];
						};
						_handle = [_group,_nearestPosition,_debug] spawn a3e_fnc_EngageReportedGroup;
						waituntil{scriptDone _handle};
						if(_debug) then {
							player sidechat format["%1 is returning to patrol",_group];
						};
					};
				};
			};			
		};
		if(!isNil("_markerName")) then {
			_destinationPos = [_markerName] call a3e_fnc_rnd_marker_pos;
		} else {
			_destinationPos = [(getpos _leader select 0) + random 600 - 300,(getpos _leader select 1) + random 600 - 300,0];
		};

		if(_debug) then {
			_debugmarker1 setmarkerpos getpos _leader;
			_debugmarker2 setmarkerpos _destinationPos;
		};
		//doMove because groupMove makes a waypoint
		_leader doMove _destinationPos;
		//IIRC walking speed is 101 m/min (this may be from Arma 2)?
		_time = ((_currentPos distance _destinationPos) / 101) * 60;
		_time = _time + random 20;
		sleep _time;
	} else {
		//Place for possible flanking, smoke, etc
		// also we can plug the detection and reporting of the players here as this block is reached at detecting enemys
		sleep 30;
	};
};
