// Norrn_LeaderFix
// MAY 2013 - norrin
private ["_leader","_group","_groupID"];
_leader 		= _this select 0;
_group			= _this select 1;
_groupID		= _this select 2;
_groupMembers	= _this select 3;
{if (!(_x in units _group) && alive _x) then {[_x] joinSilent _group}}forEach _groupMembers;
if (_leader != (leader _group)) then {
	{_x doFollow _leader} forEach units _group;
	{_x doMove getPos _x} forEach units _group;
};
