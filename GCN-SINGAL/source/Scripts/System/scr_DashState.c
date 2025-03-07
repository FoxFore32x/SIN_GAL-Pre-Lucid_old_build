#include <stdio.h>
#include "scr_System.h"

void DashState(){

    if ((key_left2) && !(xscale = -1)) {
		
    xscale = -1;
    dashSpd = 0.6;
    dashSpd = clamp(dashSpd, spd, maxDashSpd);
    hsp = xscale * dashSpd;

		
    } else if ((key_right2) && !(xscale = 1)) {
		
	xscale = 1;	
    dashSpd = 0.6;
    dashSpd = clamp(dashSpd, spd, maxDashSpd);
    hsp = xscale * dashSpd;
			
    }

    // Control de velocidad y dirección
    if (key_run2) {
        
        dashSpd += 0.6;
        dashSpd = clamp(dashSpd, spd, maxDashSpd);
        hsp = xscale * dashSpd;
    }

}

void FreeState(GameObject objlmao){
	
	//bool onground = place_meeting(x, y + 1, &obj_solid);
	float hmove = (key_right2 - key_left2) * spd;

	if (hmove != 0) {
	
		spd += 0.7;
		spd = clamp(spd, 0, maxSpd);
	
	    hsp = Approach(hsp, hmove, accel); 
	
		} else {
		
		spd = 0.7;
	    hsp = Approach(hsp, 0, fricc); 
	}
	
}