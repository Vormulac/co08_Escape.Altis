private["_group","_state","_position"];
_position = _this select 0;

{
	_group = _x;
	if((side _group) == resistance || (side _group) == east) then {
		if((((units _group) select 0) distance _position)<a3e_var_maxSearchRange) then {
			_state = [_group] call a3e_fnc_GetTaskState;
			if(_state == "PATROL" || _state == "SAD") then {
				[_group,getposATL _position] spawn a3e_fnc_Search;
			};
		};
	};
} foreach AllGroups;