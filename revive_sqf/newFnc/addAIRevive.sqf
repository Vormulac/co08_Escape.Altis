// addAIRevive.sqf
// norrin, MARCH 2013
_name 		  = _this select 0;
_medpacks	  = _this select 1;
_can_revive	  = _this select 2;
_can_revive_2 = _this select 3;
_medic_1	  = _this select 4;
_medic_2	  = _this select 5;
if (_name isKindOf _can_revive   && _medpacks  == 0 ||
	_name isKindOf _can_revive_2 && _medpacks  == 0 ||
	_name isKindOf _can_revive   && _medpacks  == 1 && (_name getVariable "NORRN_medpacks") > 0 ||
	_name isKindOf _can_revive_2 && _medpacks  == 1 && (_name getVariable "NORRN_medpacks") > 0 ||
	_name isKindOf _medic_1  	 && _medpacks  == 1 && (_name getVariable "NORRN_medpacks") > 0 ||
	_name isKindOf _medic_2      && _medpacks  == 1 && (_name getVariable "NORRN_medpacks") > 0) then {
		_unc_friend = (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4] select 1);
			if ((_unc_friend getVariable "NORRN_AIunconscious") && !(_name getVariable "NORRN_unconscious") && animationState _name != "AinvPknlMstpSlayWrflDnon_medic") then {
				[0,0,0,[_name, _unc_friend]] execVM "revive_sqf\heal.sqf";
			};
};