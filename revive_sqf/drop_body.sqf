// drop_body.sqf
// norrin, MAY 2013
_dragee			  = _this select 3; 
NORRN_remove_drag = true;  
r_drag_sqf 		  = false;
r_carry_sqf 	  = false;
player removeAction NORRN_dropAction;
detach _dragee;
norrnRpvEH = [NORRN_rSwitchAnim,[[player,""]]];
publicVariable "norrnRpvEH";
player switchMove "";
_dragee setVariable ["NORRN_unit_dragged", false, true]; 
norrnRpvEH = [NORRN_rSwitchAnim,[[_dragee,"Unconscious"]]];
publicVariable "norrnRpvEH";
_dragee switchMove "Unconscious";
NORRN_Dragged_body = objNull;
