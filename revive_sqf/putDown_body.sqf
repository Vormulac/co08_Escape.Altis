// putDown_body.sqf
// MAY 2013 - norrin
private ["_dragee","_unit"];
_dragee		= _this select 3; 
_unit 		= player;
player removeAction NORRN_putDownAction; 
//NORRN_remove_drag = true;  
r_carry_sqf = false;
detach _unit;
detach _dragee;
_dragee switchMove r_unc_animation;
_unit switchMove "";
norrnRpvEH = [NORRN_rswitchAnim, [_dragee,r_unc_animation]];
publicVariable "norrnRpvEH";
sleep 0.1;
norrnRpvEH = [NORRN_rswitchAnim, [_unit,""]];
publicVariable "norrnRpvEH";



