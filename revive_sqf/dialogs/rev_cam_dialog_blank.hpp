// rev_cam_dialog_blank.hpp
// norrin, MARCH 2013

class rev_cam_dialog_blank 
{
	idd = 99993;   
	movingEnable = false;
	objects[] = {};
	controls[] = {mouse};
	controlsBackground[] = {};
	
	class mouse  : NORRNmouseHandler {};
	
};

