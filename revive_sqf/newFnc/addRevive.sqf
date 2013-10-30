// addRevive.sqf
// norrin, OCTOBER 2013
_nearest_unit 	  = _this select 0;
_can_revive		  = _this select 1;
_can_revive_2	  = _this select 2;
_medic_1		  = _this select 3;
_medic_2		  = _this select 4;
_can_be_revived   = _this select 5;
_can_be_revived_2 = _this select 6;
_c				  = _this select 7;
if (_c == 0 && !r_carry_sqf && (_nearest_unit getVariable "NORRN_AIunconscious")) then {
	if (player isKindOf _can_revive   && _medpacks  == 0 ||
		player isKindOf _can_revive_2 && _medpacks  == 0 ||
		player isKindOf _can_revive   && _medpacks  == 1 && (player getVariable "NORRN_medpacks") > 0 ||
		player isKindOf _can_revive_2 && _medpacks  == 1 && (player getVariable "NORRN_medpacks") > 0 ||
		player isKindOf _medic_1  	 && _medpacks  == 1 && (player getVariable "NORRN_medpacks") > 0 ||
		player isKindOf _medic_2      && _medpacks  == 1 && (player getVariable "NORRN_medpacks") > 0) then {
			Norrn_reviveAction = player addAction ["Revive", "revive_sqf\heal.sqf",[player, _nearest_unit], 0, false, true];
			_c = 1;		
		};
};
if (!(_nearest_unit getVariable "NORRN_AIunconscious") && _c == 1 || r_drag_sqf && _c == 1 || r_carry_sqf && _c == 1) then {
	player removeAction Norrn_reviveAction;
	_c = 0; 		
};
_c