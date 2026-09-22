// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function pl_characters(){
	switch (character){
	
		case characters.teori:
		
			var _spbox = noone;
		
				//sword
			fd_sword_side = frame_factory(2,3,12);
			fd_sword_up   = frame_factory(2,3,12);
			fd_sword_down = frame_factory(2,3,12);

			//dagger
			fd_dagger_side = frame_factory(2,5,10);
			fd_dagger_up   = frame_factory(2,5,10);
			fd_dagger_down = frame_factory(2,5,10);
		
			/*image_xscale = sprite_width * 0.125;
			image_yscale = sprite_height * 0.125;*/
			
			/*if(currentState == states.attack || parried) animSize = 1;
			else */animSize = 0.06;
			
			//animation variables
			animEmpty = sprEmpty;
			idleSprite = sTeori_Idle;
			animJump = sTeori_Jump;
			animRun = sTeori_Run;
			animWallRun = sTeoriWallslide;
			animDash = sTeori_Dash;
			animDead = sTeori_Dead;
			animHit = sTeori_Hit;
			animTum = sTeori_Tumble;
			animTumGround = sTeori_Tumble_Light;
			animParry = sLambUAttLG;
			animRecov = sTeori_Recovery;
			weaponIdle = sTeori_Idle_Arms;
			weaponRun = sTeori_Run_Arms;
			weaponJump = sTeori_Jump_Arms;
			
			spAttMax = 50;
			
		    switch(currentState){
		        case states.spAtt:

		            if(!spHasOneFrameAct == false){
		                _spbox = specialbox_create(
		                    -2 * facing * global.sprScale,
		                    -16 * global.sprScale,
		                    26 * facing * global.sprScale,
		                    10 * global.sprScale,
		                    6,
		                    false,
		                    0,
		                    0,
		                    0,
		                    0
		                );

		                spHasOneFrameAct = true;
		            }

		            if(_spbox != noone) _spbox.xScale++;

		        break;
		    }
			
			switch(weapon){
			    case weapons.sword:
				
					sideSpriteG  = sTeoriSAttSG;
			        sideSpriteA  = sTeoriSAttSA;
			        upSpriteG    = sTeoriUAttSG;
			        upSpriteA    = sTeoriUAttSA;
			        downSpriteG  = sTeoriDAttSG;
			        downSpriteA  = sTeoriDAttSA;
					
					if((left || right) && (!down)) {
						attDirX = heavyDist[tired] * global.sprScale * facing;
					}
					else attDirX = noone;
					
					smallStAtJump = true;
					if(!hasSAttWhJump){
						
						if(up){
							attDirY = -heavyDist[tired] * global.sprScale;
						}
						else attDirY = -1.51 * global.sprScale;
						if (currentState == states.attack && chitTimer == 1) hasSAttWhJump = true;
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
			        upAtT = 15;
			        sideAtT = 15;
			        downAtT = 15;
        
			        upAtST = 20;
			        sideAtST = 20;
			        downAtST = 20;
					
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
				
					sideSpriteG  = sTeoriSAttLG;
			        sideSpriteA  = sTeoriSAttLA;
			        upSpriteG    = sTeoriUAttLG;
			        upSpriteA    = sTeoriUAttLA;
			        downSpriteG  = sTeoriDAttLG;
			        downSpriteA  = sTeoriDAttLA;
					
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
							hitOffY = -26;
							hitWidth = 35;
							hitHeight = 15;
							hitDur = 3;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -8;
							hitOffY = -50;
							hitWidth = 24;
							hitHeight = 40;
							hitDur = 3;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = -5;
							hitOffY = -11;
							hitWidth = 30;
							hitHeight = 28;
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
			
			/*image_xscale = sprite_width * 0.125;
			image_yscale = sprite_height * 0.125;*/
			
			//animation variables
			/*if(currentState == states.attack || parried) animSize = 1;
			else*/ animSize = 0.06;
			
			animEmpty = sprEmpty;
			idleSprite = sLamb_Idle;
			animJump = sLamb_Jump;
			animRun = sLamb_Run;
			animWallRun = sLambWallslide;
			animDash = sLamb_Dash;
			animDead = sLamb_Dead;
			animHit = sLamb_Hit;
			animTum = sLamb_Tumble;
			animTumGround = sLamb_Tumble_Light;
			animParry = sLambUAttLG;
			animRecov = sLamb_Recovery;
			weaponIdle = sLamb_Idle_Arms;
			weaponRun = sLamb_Run_Arms;
			weaponJump = sLamb_Jump_Arms;
			
			spAttMax = 50;
		
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
					        hitbox_create(-2 * facing*(global.sprScale), -16*(global.sprScale), 26 * facing*(global.sprScale), 10*(global.sprScale), 6, dashHitX*(global.sprScale), dashHitY*(global.sprScale), 15, 3,false, false);
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
				
					sideSpriteG  = sTeoriSAttSG;
			        sideSpriteA  = sTeoriSAttSA;
			        upSpriteG    = sTeoriUAttSG;
			        upSpriteA    = sTeoriUAttSA;
			        downSpriteG  = sTeoriDAttSG;
			        downSpriteA  = sTeoriDAttSA;
				
					if((left || right) && (!down)) {
						if(onGround) attOnGround = true;
						else attOnGround = false;
						attDirX = heavyDist[tired] * global.sprScale * facing;
					}
					else attDirX = noone;
					
					if (currentState != states.attack) gravityActive = 1;
					
					if(!hasSAttWhJump){
						
						if (currentState == states.attack){
						
							if(!smallStopDone) smallStop = true;
							gravityActive = 0;
						}
					
						if(up) attDirY = -heavyDist[tired] * global.sprScale;
						else if(down) attDirY = heavyDist[tired] * global.sprScale;
						else attDirY = noone;
						
						if (currentState == states.attack && chitTimer == 1){
							hasSAttWhJump = true;
						}
					}
					
					if(hasHit) xSpeed = 0;
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
				
					sideSpriteG  = sLambSAttLG;
			        sideSpriteA  = sLambSAttLA;
			        upSpriteG    = sLambUAttLG;
			        upSpriteA    = sLambUAttLA;
			        downSpriteG  = sLambDAttLG;
			        downSpriteA  = sTeoriDAttLA;
					
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
							hitOffY = -26;
							hitWidth = 35;
							hitHeight = 15;
							hitDur = 3;
						break;
						
						case attacks.up_ground:
						case attacks.up_air:
							hitOffX = -8;
							hitOffY = -50;
							hitWidth = 24;
							hitHeight = 40;
							hitDur = 3;
						break;
						
						case attacks.down_ground:
						case attacks.down_air:
							hitOffX = -5;
							hitOffY = -11;
							hitWidth = 30;
							hitHeight = 28;
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

			animSize = 1;
			animEmpty = sprEmpty;
			animJump = sprPlayer_Jump_Base;
			animRun = sprPlayer_Run_Base;
			animWallRun = sprPlayer_WallSlide;
			animDash = sprPlayer_Dash_Base;
			animDead = sprPlayer_Dead_Base;
			animHit = sprPlayer_Hit_Base;
			animTum = sprPlayer_Tumble_Base;
			animTumGround = sprPlayer_Tumble_Light;
			animParry = sprDagger_Attack_Up_A;
			animRecov = sprPlayer_Recovery_Base;
			
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