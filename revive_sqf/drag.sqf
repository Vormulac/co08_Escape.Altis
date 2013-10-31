// drag.sqf
// norrin, October 2013
private ["_dragee","_pos","_dir"];
_dragee				= _this select 3;
_can_be_revived 	= NORRN_revive_array select 20;
_can_be_revived_2 	= NORRN_revive_array select 21;
if (isNull _dragee) exitWith {}; 
_dragee setVariable ["NORRN_unit_dragged", true, true];
// Add "C" key down eventhandler
NORRN_noCkey  = false;
NORRN_reviveDrag_C_keyDownEHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call NORRN_reviveDrag_C_keyDown"];
//player assumes dragging posture
sleep 0.25;
_dragee playMoveNow "AinjPpneMrunSnonWnonDb_grab";
player playMoveNow "acinpknlmstpsraswrfldnon";
sleep 1;
//unconscious unit assumes dragging posture
norrnRpvEH = [NORRN_rAnimDrag,[_dragee,player]];
publicVariable "norrnRpvEH";
[[_dragee,player]] call NORRN_rAnimDrag;
_dragee attachto [player,[0.1, 1.01, 0]];
sleep 0.1;
//rotate wounded units so that it is facing the correct direction
norrnR180 = _dragee;
publicVariable "norrnR180";
_dragee  setDir 180;
r_drag_sqf 	= true;
//Unnecessary actions removed & drop body added 
if (!isNil "Norrn_dragAction") then {player removeAction Norrn_dragAction};
if (!isNil "Norrn_reviveAction") then {player removeAction Norrn_reviveAction};
NORRN_dropAction = player addAction ["Drop body", "revive_sqf\drop_body.sqf",_dragee, 0, false, true];
while {r_drag_sqf} do {	
	_anim_name = animationstate player; 
	if (!alive _dragee ||  !((animationstate player) in ["acinpknlmstpsraswrfldnon","acinpknlmwlksraswrfldb"])  || !(_dragee getVariable "NORRN_AIunconscious" || NORRN_noCkey)) exitWith { 
		player removeAction NORRN_dropAction;
		detach _dragee; 
		player switchMove "";
		r_drag_sqf = false;
	};	 
	//if unconcious unit
	if (player getVariable "NORRN_unconscious") exitWith {	
		player removeAction NORRN_dropAction;
		detach _dragee;
		r_drag_sqf = false;
	}; 	
	sleep 0.1;
};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", NORRN_reviveDrag_C_keyDownEHId];