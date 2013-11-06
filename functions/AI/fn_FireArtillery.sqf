private["_position","_success"];
_position = [_this,0,[0,0,0],[[]]] call bis_fnc_param;


_success = false;
{
	if(_position inRangeOfArtillery [[_x], (getArtilleryAmmo [_x]) select 0]) then {
		if(a3e_debug_artillery) then {
			player sidechat format["Arti %1 is in range (Distance %2)",_x,_x distance _position];
		};
		[_x,_position] spawn {
			for "_i" from 0 to a3e_var_artillery_rounds do {  //--- 5 = how many rounds you want fired
				_mortar = _this select 0;                //--- name of the mortar
				_center = _this select 1;  //--- central point around which the mortar rounds will hit
				_radius = a3e_var_artillery_dispersion;                       //--- random radius from the center

			_pos = [
				(_center select 0) - _radius + (2 * random _radius),
				(_center select 1) - _radius + (2 * random _radius),
				0
				];
			_mortar commandArtilleryFire [
								_pos,
								getArtilleryAmmo [_mortar] select 0,
								1
							];
			sleep 3;
			};
		};
		if(true) exitwith {
			if(a3e_debug_artillery) then {
				player sidechat "Artillery strike complete";
			};
			_success = true;
		};
	} else {
		if(a3e_debug_artillery) then {
			player sidechat format["Arti %1 is out of range (Distance %2)",_x,_x distance _position];
		};
	};
} foreach a3e_var_artillery_units;

_success