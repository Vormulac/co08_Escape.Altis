private["_run","_flag"];


if(isserver && isMultiplayer) then {
		player sidechat "Server";
	_run = true;
	while{_run} do {
		_flag = true;
		{
			if((_x getvariable "AT_isConscious")) then {
					_flag = false;			
			} else {
			};
		} foreach playableunits;
		if(_flag) exitwith {
			[["end1",false,5],"BIS_fnc_endMission",true] call BIS_fnc_MP;
			_run =  false;
		};
		sleep 5;
	};
};