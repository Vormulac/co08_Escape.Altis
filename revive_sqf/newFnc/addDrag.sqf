// addDrag.sqf
// norrin, OCTOBER 2013
private ["_near_dragUnit","_name","_can_be_revived","_can_be_revived_2","_cc"];
_name 			  = _this select 0;
_can_be_revived	  = _this select 1;
_can_be_revived_2 = _this select 2;
_cc				  = _this select 3;
_near_dragUnit = (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4] select 1);
if (_cc == 0) then {
	if(_near_dragUnit getVariable "NORRN_AIunconscious" && !r_carry_sqf) then {
		Norrn_dragAction = _name addAction ["Drag body", "revive_sqf\drag.sqf",_near_dragUnit, 0, false, true]; 
		_cc = 1;		
	};
};	
if (_cc == 1 && !(_near_dragUnit getVariable "NORRN_AIunconscious") || r_drag_sqf) then {
	if (!isNil "Norrn_dragAction") then {_name removeAction Norrn_dragAction};
	_cc = 0;
};
_cc