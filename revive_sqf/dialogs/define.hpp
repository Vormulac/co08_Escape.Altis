#define CT_STATIC			0
#define CT_BUTTON			1
#define CT_EDIT				2
#define CT_SLIDER			3
#define CT_COMBO			4
#define CT_LISTBOX			5
#define CT_TOOLBOX			6
#define CT_CHECKBOXES		7
#define CT_PROGRESS			8
#define CT_HTML				9
#define CT_STATIC_SKEW		10
#define CT_ACTIVETEXT		11
#define CT_TREE				12
#define CT_STRUCTURED_TEXT	13 
#define CT_3DSTATIC			20
#define CT_3DACTIVETEXT		21
#define CT_3DLISTBOX		22
#define CT_3DHTML			23
#define CT_3DSLIDER			24
#define CT_3DEDIT			25
#define CT_OBJECT			80
#define CT_OBJECT_ZOOM		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_USER				99

// Static styles
#define ST_HPOS				0x0F
#define ST_LEFT				0
#define ST_RIGHT			1
#define ST_CENTER			2
#define ST_UP				3
#define ST_DOWN				4
#define ST_VCENTER			5

#define ST_TYPE				0xF0
#define ST_SINGLE			0
#define ST_MULTI			16
#define ST_TITLE_BAR		32
#define ST_PICTURE			48
#define ST_FRAME			64
#define ST_BACKGROUND		80
#define ST_GROUP_BOX		96
#define ST_GROUP_BOX2		112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE		144
#define ST_WITH_RECT		160
#define ST_LINE				176

#define ST_SHADOW			256
#define ST_NO_RECT			512

#define ST_TITLE			ST_TITLE_BAR + ST_CENTER

#define FontHTML			"PuristaMedium"
#define FontM				"PuristaMedium"

#define Dlg_ROWS			36
#define Dlg_COLS			90

#define Dlg_CONTROLHGT		((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH		((100/Dlg_COLS)/100)

#define Dlg_TEXTHGT_MOD		0.9
#define Dlg_ROWSPACING_MOD	1.3

#define Dlg_ROWHGT			(Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT			(Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)

class NORRNRscText
{
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	type = 0;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "PuristaMedium";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
	colorText[] = {1,1,1,1.0};
	colorBackground[] = {0,0,0,0};
	linespacing = 1;
	text = "";
};
class NORRNRscListBox
{
	style = 16;
	type = 5;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 1.2;
	colorBackground[] = {0,0,0,0.3};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};
class NORRNRscButton
{
	style = 2;
	type = 1;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
	colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	colorShadow[] = {0,0,0,1};
	colorBorder[] = {0,0,0,1};
	borderSize = 0.0;
	soundEnter[] = {"\A3\ui_f\data\sound\onover",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape",0.09,1};
};
class NORRNRscNavButton:NORRNRscButton
{
	w=0.1;h=0.04;
	x=0.90;
	sizeEx = 0.022;
	colorText[] = { 0, 0, 0, 1 };
	colorDisabled[] = { 0, 0, 1, 0.7 };   
	colorBackground[] = { 1, 1, 1, 0.5 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 };   
	colorBackgroundActive[] = { 0.5, 0.5, 0.5, 0.5 }; 
	colorFocused[] = { 0.31, 0.31, 0.31, 0.31 }; 
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0.5, 0.5, 0.5, 0.5 };	
};	
class NORRNRscActiveText 
{
	idc = -1;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.035;
	font = "PuristaMedium";
	type = 11;
	shadow = 2;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
	color[] = {0,0,0,1};
	colorText[] = {0,0,0,1};
	colorActive[] = {0.3,0.4,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\onover",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape",0.09,1};
	text = "";
	default = 0;
};
class NORRNRscControlsGroup 
{
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
	class VScrollbar
	{
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		shadow = 0;
	};
	class HScrollbar
	{
		height = 0.028;
		shadow = 0;
	};
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	class Controls{};
};
class NORRNRscCombo 
{
	style = 16;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelect[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorBackground[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorScrollbar[] = {1,0,0,1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.5)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	soundSelect[] = { "", 0, 1 };
	soundExpand[] = { "", 0, 1 };
	soundCollapse[] = { "", 0, 1 };
	maxHistoryDelay = 0;
};
class NORRNmouseHandler : NORRNRscControlsGroup 
{			
	onMouseMoving = "[""MouseMoving"",_this] call MouseEvents";
	onMouseButtonDown = "[""MouseButtonDown"",_this] call MouseEvents";
	onMouseButtonUp = "[""MouseButtonUp"",_this] call MouseEvents";
	onMouseZChanged = "[""MouseZChanged"",_this] call MouseEvents";			
	idc = 2501;
	type = 15;
	style = 0;
	x = 0.0; y = 0.0;
	w = 1.0; h = 1.0;			
	colorBackground[] = {0.2, 0.0, 0.0, 0.0};
		
	class VScrollbar 
	{
		color[] = {1, 1, 1, 1};
		width = 0.021;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = false;			
	};
	class HScrollbar 
	{
		color[] = {1, 1, 1, 1};
		height = 0.028;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = false;	
	};
	class ScrollBar 
	{
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui_f_data\data\gui\cfg\Scrollbar\thumb_ca.paa";
		arrowFull = "\ca\ui_f_data\data\gui\cfg\Scrollbar\arrowfull_ca.paa";
		arrowEmpty = "\ca\ui_f_data\data\gui\cfg\Scrollbar\arrowempty_ca.paa";
		border = "\ca\ui_f_data\data\gui\cfg\Scrollbar\border_ca.paa";
	};
	
	class Controls {};
};
class NORRNRscPicture
{
	type = 0;
	shadow = 0;
	colorText[] = {1,1,1,1};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};
class NORRNRscMapControl 
{
	 type = 101;
	 style = 48;
	 idc = -1;
	 colorText[] = {0, 0, 0, 1};
	 font = "PuristaMedium";
	 moveOnEdges = 1;
	 x = "SafeZoneXAbs";
	 y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	 w = "SafeZoneWAbs";
	 h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	 sizeEx = 0.04;
	 shadow = 0;
	 ptsPerSquareSea = 5;
	 ptsPerSquareTxt = 3;
	 ptsPerSquareCLn = 10;
	 ptsPerSquareExp = 10;
	 ptsPerSquareCost = 10;
	 ptsPerSquareFor = 9;
	 ptsPerSquareForEdge = 9;
	 ptsPerSquareRoad = 6;
	 ptsPerSquareObj = 9;
	 showCountourInterval = 0;
	 scaleMin = 0.001;
	 scaleMax = 1.0;
	 scaleDefault = 0.16;
	 maxSatelliteAlpha = 0.85;
	 alphaFadeStartScale = 0.35;
	 alphaFadeEndScale = 0.4;
	 colorBackground[] = {0.969,0.957,0.949,1.0};
	 colorSea[] = {0.467,0.631,0.851,0.5};
	 colorForest[] = {0.624,0.78,0.388,0.5};
	 colorForestBorder[] = {0.0,0.0,0.0,0.0};
	 colorRocks[] = {0.0,0.0,0.0,0.3};
	 colorRocksBorder[] = {0.0,0.0,0.0,0.0};
	 colorLevels[] = {0.286,0.177,0.094,0.5};
	 colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	 colorCountlines[] = {0.572,0.354,0.188,0.25};
	 colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	 colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	 colorPowerLines[] = {0.1,0.1,0.1,1.0};
	 colorRailWay[] = {0.8,0.2,0.0,1.0};
	 colorNames[] = {0.1,0.1,0.1,0.9};
	 colorInactive[] = {1.0,1.0,1.0,0.5};
	 colorOutside[] = {0.0,0.0,0.0,1.0};
	 colorTracks[] = {0.84,0.76,0.65,0.15};
	 colorTracksFill[] = {0.84,0.76,0.65,1.0};
	 colorRoads[] = {0.7,0.7,0.7,1.0};
	 colorRoadsFill[] = {1.0,1.0,1.0,1.0};
	 colorMainRoads[] = {0.9,0.5,0.3,1.0};
	 colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
	 colorGrid[] = {0.1,0.1,0.1,0.6};
	 colorGridMap[] = {0.1,0.1,0.1,0.6};
	 fontLabel = "PuristaMedium";
	 sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	 fontGrid = "TahomaB";
	 sizeExGrid = 0.02;
	 fontUnits = "TahomaB";
	 sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	 fontNames = "PuristaMedium";
	 sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	 fontInfo = "PuristaMedium";
	 sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	 fontLevel = "TahomaB";
	 sizeExLevel = 0.02;
	 text = "#(argb,8,8,3)color(1,1,1,1)";
	 class Legend
	 {
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "PuristaMedium";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		colorBackground[] = {1,1,1,0.5};
		color[] = {0,0,0,1};
	 };
	class Task
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
	  iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
	  iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
	  iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
	  iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
	  color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
	  colorCreated[] = {1,1,1,1};
	  colorCanceled[] = {0.7,0.7,0.7,1};
	  colorDone[] = {0.7,1,0.3,1};
	  colorFailed[] = {1,0.3,0.2,1};
	  size = 27;
	  importance = 1;
	  coefMin = 1;
	  coefMax = 1;
	};
	class ActiveMarker {
	 color[] = {0.3, 0.1, 0.9, 1};
	 size = 50;
	};
	class Waypoint
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[] = {0,0,0,1};
		size = 32;
		importance = 1.2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	class WaypointCompleted
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[] = {0,0,0,1};
		size = 32;
		importance = 1.2 * 16 * 0.05;
		coefMin = 0.9;
		coefMax = 4;
	};
	class CustomMark
	{
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {0,0,0,1};
	};
	class Command
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class Bush
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	  color[] = {0.45,0.64,0.33,0.4};
	  size = "14/2";
	  importance = "0.2 * 14 * 0.05 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	};
	class Rock
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
	  color[] = {0.1,0.1,0.1,0.8};
	  size = 12;
	  importance = "0.5 * 12 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	};
	class SmallTree
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	  color[] = {0.45,0.64,0.33,0.4};
	  size = 12;
	  importance = "0.6 * 12 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	};
	class Tree
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
	  color[] = {0.45,0.64,0.33,0.4};
	  size = 12;
	  importance = "0.9 * 16 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	};
	class busstop
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class fuelstation
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class hospital
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class church
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class lighthouse
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class power
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class powersolar
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class powerwave
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class powerwind
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class quay
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class shipwreck
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class transmitter
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class watertower
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {1,1,1,1};
	};
	class Cross
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {0,0,0,1};
	};
	class Chapel
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
	  size = 24;
	  importance = 1;
	  coefMin = 0.85;
	  coefMax = 1.0;
	  color[] = {0,0,0,1};
	};
	class Bunker
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
	  size = 14;
	  importance = "1.5 * 14 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
	class Fortress
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
	  size = 16;
	  importance = "2 * 16 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
	class Fountain
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
	  size = 11;
	  importance = "1 * 12 * 0.05";
	  coefMin = 0.25;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
	class Ruin
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
	  size = 16;
	  importance = "1.2 * 16 * 0.05";
	  coefMin = 1;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
	class Stack
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
	  size = 20;
	  importance = "2 * 16 * 0.05";
	  coefMin = 0.9;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
	class Tourism
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
	  size = 16;
	  importance = "1 * 16 * 0.05";
	  coefMin = 0.7;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
	class ViewTower
	{
	  icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
	  size = 16;
	  importance = "2.5 * 16 * 0.05";
	  coefMin = 0.5;
	  coefMax = 4;
	  color[] = {0,0,0,1};
	};
};
