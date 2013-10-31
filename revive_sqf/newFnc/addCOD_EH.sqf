// addCOD_EH.sqf
_name = _this select 0;
_name addEventHandler ["hit", {(_this select 0) setVariable ["NORRN_killer", _this select 1, false]; (_this select 0) setVariable ["NORRN_K_damage",_this select 2, false]}]; //[unit, causedBy, damage]
_name addEventHandler ["dammaged", {_this execVM "revive_sqf\COD\body_damage.sqf"}]; //[unit, selectionName, damage]
_name addeventhandler ["killed", {(_this select 0) setVariable ["NORRN_kh_killer", _this select 1, false]}];