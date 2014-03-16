if (!isServer) exitWith {};

private ["_markerNo", "_markerName", "_trigger"];
["Creating extraction point."] spawn a3e_fnc_debugChat;
_markerNo = _this select 0;
_markerName = A3E_ExtractionPointsA select _markerNo;

_trigger = createTrigger["EmptyDetector", getMarkerPos _markerName];
_trigger setTriggerActivation [(A3E_SideStrings select A3E_PlayerSide), "PRESENT", false];
_trigger setTriggerArea[10, 10, 0, false];
_trigger triggerAttachVehicle [(call drn_fnc_Escape_GetPlayers) select 0];
_trigger setTriggerStatements["this", "_nil = [" + str _markerNo + "] spawn A3E_fnc_RunExtraction;", ""];

drn_var_Escape_ExtractionMarkerNo = _markerNo;
[_markerName] spawn a3e_fnc_debugChat;
["_nil = [" + str _markerNo + "] spawn A3E_fnc_RunExtraction;"] spawn a3e_fnc_debugChat;
publicVariable "drn_var_Escape_ExtractionMarkerNo";