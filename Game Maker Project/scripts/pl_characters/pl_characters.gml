// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function pl_characters(){
	switch (character){
	
		case characters.teori:
			
			switch(weapon){    
			    case weapons.sword:
					
					if(!down /*&& onGround*/) {
						if(onGround) attOnGround = true;
						else attOnGround = false;
						attDirX = 4 * global.sprScale * facing;
					}
					else attDirX = noone;
					if(onGround){
						if(up) attDirY = -3 * global.sprScale;
						else attDirY = -1.51 * global.sprScale;
					}
					else {
						/*if(!attOnGround) attDirY = 0;
						else*/ attDirY = noone;
					}
					
					//Attack Stats
			        upperAtt = 0;
			        sideAtt = 0;
			        downAtt = 0;
        
			        upperAttS = 0;
			        sideAttS = 0;
			        downAttS = 0;
        
			        //Attack directions
			        upAtX = 2;
			        sideAtX = 2;
			        downAtX = 2;
			        upAtY = -5;
			        sideAtY = -1.7;
			        downAtY = 3.2;
        
			        upAtSX = 2.5;
			        sideAtSX = 3.5;
			        downAtSX = 2.5;
			        upAtSY = -5.5;
			        sideAtSY = -3.5;
			        downAtSY = 3.5;
        
			        //Attack timers
			        upAtT = 20;
			        sideAtT = 20;
			        downAtT = 20;
        
			        upAtST = 40;
			        sideAtST = 40;
			        downAtST = 40;
					
					switch(subState){
						case attacks.side_ground:
						case attacks.side_air:
							hitOffX = -8;
							hitOffY = -28;
							hitWidth = 40;
							hitHeight = 25;
							hitDur = 6;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -12;
							hitOffY = -42;
							hitWidth = 35;
							hitHeight = 27;
							hitDur = 6;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = -12;
							hitOffY = -14;
							hitWidth = 29;
							hitHeight = 35;
							hitDur = 6;
						break;
					}
			    break;
    
			    case weapons.dagger:
					attDirX = noone;
					attDirY = noone;
					
					//Attack Stats
			        upperAtt = 0;
			        sideAtt = 0;
			        downAtt = 0;
        
			        upperAttS = 0;
			        sideAttS = 0;
			        downAttS = 0;
        
			        //Attack directions
			        upAtX = 1.2;
			        sideAtX = 1.2;
			        downAtX = 1.2;
			        upAtY = -3;
			        sideAtY = -1;
			        downAtY = 2;
        
			        upAtSX = 2;
			        sideAtSX = 3;
			        downAtSX = 2;
			        upAtSY = -5;
			        sideAtSY = -3;
			        downAtSY = 3;
        
			        //Attack timers
			        upAtT = 10;
			        sideAtT = 10;
			        downAtT = 10;
        
			        upAtST = 30;
			        sideAtST = 30;
			        downAtST = 30;
					
					switch(subState){
						case attacks.side_ground:
						case attacks.side_air:
							hitOffX = 0;
							hitOffY = -21;
							hitWidth = 25;
							hitHeight = 10;
							hitDur = 3;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -8;
							hitOffY = -40;
							hitWidth = 18;
							hitHeight = 25;
							hitDur = 3;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = 5;
							hitOffY = -11;
							hitWidth = 17;
							hitHeight = 23;
							hitDur = 3;
						break;
					}
			    break;
    
			    case weapons.spear:
			    break;
    
			    /*case weapons.axe:
			        axe_attacks();
			    break;*/
			}
		break;
		
		case characters.lamb:
			
			/*dashHSpeed = 6.5 * global.sprScale;
			dashYSpeed = 6.5 * global.sprScale;*/
		
			switch(currentState){
			
				case states.dash:
					custDash = true;
			
					if (willDash) {
					    // Gradually approach zero velocity
					    ySpeed = approach(ySpeed * 1.10, 0, 0.5 * god.gameSpeed);

						// Simplified xSpeed slowdown
					    if (abs(xSpeed) >= 1 || (xSpeed == 0 && (!up || !down))) {
					        xSpeed = approach(xSpeed * 1.10, 0, 0.5 * god.gameSpeed);
					    }

						// Hitbox creation timing
					    if (dashDur >= dashDurMax){
					        invFrames = 6;
					        hitbox_create(-2 * facing*(global.sprScale), -16*(global.sprScale), 26 * facing*(global.sprScale), 10*(global.sprScale), 6, dashHitX*(global.sprScale), dashHitY*(global.sprScale), 15, 3);
					    }
						
						// Reset temporary speed near end
					    if (dashDur <= 2){
							xSpeed /= 2;
					        ySpeed /= 2;
					        tSpeed = 0;
						}

					    // Countdown and reset state
					    dashDur -= 1 * god.gameSpeed;
					    if (dashDur <= 0 || (jumpKeyBuffered || lattKeyBuffered || hattKeyBuffered)) {
							if((jumpKeyBuffered || lattKeyBuffered || hattKeyBuffered)) dashCanCldn = dashCanCldnMax;
					        xSpeed /= 1.5;
					        ySpeed /= 1.5;
					        dashDur = 0;
					        dashAnt = dashAntLimit;
					        willDash = false;
					        tSpeed = 10 * (global.sprScale);
					        state_reset();
					    }
					}
				break;
			}
						
			switch(weapon){    
			    case weapons.sword:
					if(!down) attDirX = 5 * global.sprScale * facing;
					else attDirX = noone;
					if(onGround){
						if(up) attDirY = -3 * global.sprScale;
						else attDirY = -1.51 * global.sprScale;
					}
					else attDirY = noone;
					
					//Attack Stats
			        upperAtt = 0;
			        sideAtt = 0;
			        downAtt = 0;
        
			        upperAttS = 0;
			        sideAttS = 0;
			        downAttS = 0;
        
			        //Attack directions
			        upAtX = 2;
			        sideAtX = 2;
			        downAtX = 2;
			        upAtY = -5;
			        sideAtY = -1.7;
			        downAtY = 3.2;
        
			        upAtSX = 2.5;
			        sideAtSX = 3.5;
			        downAtSX = 2.5;
			        upAtSY = -5.5;
			        sideAtSY = -3.5;
			        downAtSY = 3.5;
        
			        //Attack timers
			        upAtT = 20;
			        sideAtT = 20;
			        downAtT = 20;
        
			        upAtST = 40;
			        sideAtST = 40;
			        downAtST = 40;
					
					switch(subState){
						case attacks.side_ground:
						case attacks.side_air:
							hitOffX = -8;
							hitOffY = -28;
							hitWidth = 40;
							hitHeight = 17;
							hitDur = 6;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -12;
							hitOffY = -42;
							hitWidth = 35;
							hitHeight = 27;
							hitDur = 6;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = -12;
							hitOffY = -14;
							hitWidth = 29;
							hitHeight = 35;
							hitDur = 6;
						break;
					}
			    break;
    
			    case weapons.dagger:
					attDirX = noone;
					attDirY = noone;
					
					//Attack Stats
			        upperAtt = 0;
			        sideAtt = 0;
			        downAtt = 0;
        
			        upperAttS = 0;
			        sideAttS = 0;
			        downAttS = 0;
        
			        //Attack directions
			        upAtX = 1.2;
			        sideAtX = 1.2;
			        downAtX = 1.2;
			        upAtY = -3;
			        sideAtY = -1;
			        downAtY = 2;
        
			        upAtSX = 2;
			        sideAtSX = 3;
			        downAtSX = 2;
			        upAtSY = -5;
			        sideAtSY = -3;
			        downAtSY = 3;
        
			        //Attack timers
			        upAtT = 10;
			        sideAtT = 10;
			        downAtT = 10;
        
			        upAtST = 30;
			        sideAtST = 30;
			        downAtST = 30;
					
					switch(subState){
						case attacks.side_ground:
						case attacks.side_air:
							hitOffX = 0;
							hitOffY = -21;
							hitWidth = 25;
							hitHeight = 10;
							hitDur = 3;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -8;
							hitOffY = -40;
							hitWidth = 18;
							hitHeight = 25;
							hitDur = 3;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = 5;
							hitOffY = -11;
							hitWidth = 17;
							hitHeight = 23;
							hitDur = 3;
						break;
					}
			    break;
    
			    case weapons.spear:
			    break;
    
			    /*case weapons.axe:
			        axe_attacks();
			    break;*/
			}
		break;
		
		case characters.test:
		
			switch(weapon){    
			    case weapons.sword:
					attDirX = noone;
					attDirY = noone;
					
					//Attack Stats
			        upperAtt = 0;
			        sideAtt = 0;
			        downAtt = 0;
        
			        upperAttS = 0;
			        sideAttS = 0;
			        downAttS = 0;
        
			        //Attack directions
			        upAtX = 2;
			        sideAtX = 2;
			        downAtX = 2;
			        upAtY = -5;
			        sideAtY = -1.7;
			        downAtY = 3.2;
        
			        upAtSX = 2.5;
			        sideAtSX = 3.5;
			        downAtSX = 2.5;
			        upAtSY = -5.5;
			        sideAtSY = -3.5;
			        downAtSY = 3.5;
        
			        //Attack timers
			        upAtT = 20;
			        sideAtT = 20;
			        downAtT = 20;
        
			        upAtST = 40;
			        sideAtST = 40;
			        downAtST = 40;
					
					switch(subState){
						case attacks.side_ground:
						case attacks.side_air:
							hitOffX = -8;
							hitOffY = -28;
							hitWidth = 40;
							hitHeight = 17;
							hitDur = 6;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -12;
							hitOffY = -42;
							hitWidth = 35;
							hitHeight = 27;
							hitDur = 6;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = -12;
							hitOffY = -14;
							hitWidth = 29;
							hitHeight = 35;
							hitDur = 6;
						break;
					}
			    break;
    
			    case weapons.dagger:
					attDirX = noone;
					attDirY = noone;
					
					//Attack Stats
			        upperAtt = 0;
			        sideAtt = 0;
			        downAtt = 0;
        
			        upperAttS = 0;
			        sideAttS = 0;
			        downAttS = 0;
        
			        //Attack directions
			        upAtX = 1.2;
			        sideAtX = 1.2;
			        downAtX = 1.2;
			        upAtY = -3;
			        sideAtY = -1;
			        downAtY = 2;
        
			        upAtSX = 2;
			        sideAtSX = 3;
			        downAtSX = 2;
			        upAtSY = -5;
			        sideAtSY = -3;
			        downAtSY = 3;
        
			        //Attack timers
			        upAtT = 10;
			        sideAtT = 10;
			        downAtT = 10;
        
			        upAtST = 30;
			        sideAtST = 30;
			        downAtST = 30;
					
					switch(subState){
						case attacks.side_ground:
						case attacks.side_air:
							hitOffX = 0;
							hitOffY = -21;
							hitWidth = 25;
							hitHeight = 10;
							hitDur = 3;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -8;
							hitOffY = -40;
							hitWidth = 18;
							hitHeight = 25;
							hitDur = 3;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = 5;
							hitOffY = -11;
							hitWidth = 17;
							hitHeight = 23;
							hitDur = 3;
						break;
					}
			    break;
    
			    case weapons.spear:
			    break;
    
			    /*case weapons.axe:
			        axe_attacks();
			    break;*/
			}
			
		break;
	}
}