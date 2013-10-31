// respawn_button_3.hpp
// norrin, MARCH 2013
class Respawn_button_3 
{
	idd = 99126;
	movingEnable = false;
  	objects[] = {};
	controls[] = {mouse,TOP_BORDER,BOTTOM_BORDER,TITLE_DIALOG,PRESS_HELP,HELP_DIALOG,CAM_LIST,CAM_select,FRIEND_LIST,FRIEND_select,Help_1,
				  HINT_BOX0,HINT_BOX1,HINT_BOX2,HINT_BOX3,HINT_BOX4,HINT_BOX5,HINT_BOX6,HINT_BOX7,HINT_BOX8,HINT_BOX9,Respawn_1,Respawn_2,Respawn_3};
	controlsBackground[] = {};
		
		class mouse  : NORRNmouseHandler {};
	
		class TOP_BORDER 
		{
			idc = -1;
			type = CT_STATIC;
			style = ST_CENTER;
			x = -1.5; y = safeZoneY;
			w = 4.0; h = 0.28;
			font = "TahomaB";
			sizeEx = 0.04;
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,1};
			text = "";
		};

		class BOTTOM_BORDER	{
			idc = -1;
			type = CT_STATIC;
			style = ST_CENTER;
			x = -1.5; y = (safeZoneY + safeZoneH) -0.25;
			w = 4.0; h = 0.26;
			font = "TahomaB";
			sizeEx = 0.04;
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,1};
			text = "";
		};	

		class TITLE_DIALOG {
			idc = -1;
			type = CT_ACTIVETEXT;
			style = ST_LEFT;
			x = (safeZoneX + safeZoneW/2)-0.12; y = 0.03 + safeZoneY;
			w = 0.4; h = 0.04;
			font = "TahomaB";
			sizeEx = 0.04;
			color[] = { 1, 1, 1, 1 };
			colorActive[] = { 1, 0.2, 0.2, 1 };
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,1};
			soundEnter[] = { "", 0, 1 };   // no sound
			soundPush[] = { "", 0, 1 };
			soundClick[] = { "", 0, 1 };
			soundEscape[] = { "", 0, 1 };
			action = "";
			text = "Unconscious Camera";
			default = true;
		};
	
		class PRESS_HELP : NORRNRscText 
		{    
			idc = 10000;
			style = ST_MULTI; 
			linespacing = 1;
			x = (safeZoneX + safeZoneW) -0.25; y = (safeZoneY + safeZoneH) -0.18; 
			w = 0.4; h = 0.1;    
			text = ""; 
		};
	
		class HELP_DIALOG : NORRNRscActiveText {
			idc = -1;
			style = ST_LEFT; 
			linespacing = 1;	
			x = (safeZoneX + safeZoneW) -0.25; y = (safeZoneY + safeZoneH) -0.2;
			w = 0.4; h = 0.02;
			sizeEx = 0.02;
			action = "ctrlSetText [10000, ""Keyboard controls:\n A/D - Previous/Next target\n W/S - Previous/Next camera\n N - Toggle NV for Free Cam""]";
			text = "Press for Help";
		};
	
		class CAM_LIST: NORRNRscCombo  {
			idc = 10004;
			x = safeZoneX +0.09; y = safeZoneY +0.03;
			w = 0.15; h = 0.04;
			colorDisabled[] = {0.4,0.4,0.4,1}; 
		};
	
		class CAM_select {
			idc = 10001;
			type = CT_STATIC;        
			style = ST_LEFT; 
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			colorDisabled[] = {0.4,0.4,0.4,1};
			x = safeZoneX +0.02; y = safeZoneY +0.03;
			w = 0.08; h = 0.04;
			font = "TahomaB";
			sizeEx = 0.02;
			text = "Camera:";
			default = true;
		};

		class FRIEND_LIST: NORRNRscCombo  {
			idc = 10005;
			x = (safeZoneX + safeZoneW)-0.18; y = safeZoneY +0.03;
			w = 0.15; h = 0.04;
			colorDisabled[] = {0.4,0.4,0.4,1};
		};

		class FRIEND_select {	
			idc = 10002;
			type = CT_STATIC;        
			style = ST_LEFT; 
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			colorDisabled[] = {0.4,0.4,0.4,1};
			x = (safeZoneX + safeZoneW)-0.25; y = safeZoneY +0.03;
			w = 0.08; h = 0.04;
			font = "TahomaB";
			sizeEx = 0.02;
			text = "Target:";
			default = true;
		};

		class Help_1 : NORRNRscNavButton 
		{	
			x = safeZoneX +0.02; y = safeZoneY +0.10;
			w = 0.11; h = 0.04;
			idc = 5;
			colorBackground[] = { 1, 1, 1, 0.5 };
			text = "Call for Help";
			action = "[] call Norrn_Call4Help";	
		};

		class HINT_BOX0 : NORRNRscText {	
			idc = 10;
			x = safeZoneX +0.02; y = (safeZoneY + safeZoneH)-0.2;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX1 : NORRNRscText {	
			idc = 11;
			x = safeZoneX +0.02; y = (safeZoneY + safeZoneH)-0.18;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX2 : NORRNRscText{	
			idc = 12;
			x = safeZoneX +0.02; y = (safeZoneY + safeZoneH)-0.16;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX3 : NORRNRscText {	
			idc = 13;
			x = safeZoneX +0.56; y = (safeZoneY + safeZoneH)-0.2;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX4 : NORRNRscText{	
			idc = 14;
			x = safeZoneX +0.56; y = (safeZoneY + safeZoneH)-0.18;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX5 : NORRNRscText	{	
			idc = 15;
			x = safeZoneX +0.56; y = (safeZoneY + safeZoneH)-0.16;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX6 : NORRNRscText{	
			idc = 16;
			x = safeZoneX +0.30; y = (safeZoneY + safeZoneH)-0.2;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX7 : NORRNRscText	{	
			idc = 17;
			x = safeZoneX +0.30; y = (safeZoneY + safeZoneH)-0.18;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX8 : NORRNRscText{	
			idc = 18;
			x = safeZoneX +0.30; y = (safeZoneY + safeZoneH)-0.16;
			w = 0.4; h = 0.1;
		};
		class HINT_BOX9 : NORRNRscText	{	
			idc = 19;
			x = safeZoneX +0.30; y = (safeZoneY + safeZoneH)-0.14;
			w = 0.4; h = 0.1;
		};
		class Respawn_1	: NORRNRscNavButton
		{	
			x = (safeZoneX + safeZoneW/2)-0.25; y = safeZoneY +0.2;
			w = 0.11; h = 0.04;
			idc = 1;
			text = "RESPAWN 1";
			action = "titletext ['','BLACK FADED', 1]; [1,player] execVM ""revive_sqf\respawn_at_base.sqf""";
		};

		class Respawn_2 : NORRNRscNavButton
		{
			x = (safeZoneX + safeZoneW/2)-0.12; y = safeZoneY +0.2;
			w = 0.11; h = 0.04;
			idc = 2;
			text = "RESPAWN 2";
			action = "titletext ['','BLACK FADED', 1]; [2,player] execVM ""revive_sqf\respawn_at_base.sqf""";
		};

		class Respawn_3 : NORRNRscNavButton
		{	
			x = (safeZoneX + safeZoneW/2)+0.01; y = safeZoneY +0.2;
			w = 0.11; h = 0.04;
			idc = 3;
			text = "RESPAWN 3";
			action = "titletext ['','BLACK FADED', 1]; [3,player] execVM ""revive_sqf\respawn_at_base.sqf""";
		};
};
