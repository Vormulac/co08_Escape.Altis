private["_count","_pos","_positions","_obj","_group","_side","_unitArray","_leaderArray"];
  
_pos = [_this, 0, [],[[]],[2,3]] call BIS_fnc_param;
_side = [_this, 1, 0,[0]] call BIS_fnc_param;
_count = [_this, 2, 5,[0]] call BIS_fnc_param;
_count = _count - 1;
if(count(_pos)==0) exitwith {_group = grpNull; _group;}; 
_leaderArray = (A3E_TeamLeaders select _side);
_unitArray = (A3E_GroupMembers select _side);

//Create a Group
_group = creategroup (A3E_Sides select _side);

_unit = _group createUnit [_leaderArray select floor(random(count(_leaderArray))), _pos, [], 0, "FORM"];

for "_x" from 1 to _count do {
   _unit = _group createUnit [_unitArray select floor(random(count(_unitArray))), _pos, [], 0, "FORM"];
};
_group;