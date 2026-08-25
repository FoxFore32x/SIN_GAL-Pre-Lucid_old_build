function pl_normalState() {
	//move left and right
	isDash = false;
	hasHit = false;
	grabbed = false;
	prevDam = 0;
	if (god.isPaused) exit;
		if(left){
		    xSpeed = approach(xSpeed,-mSpeed,aSpeed * god.gameSpeed);
		}else if(right){
		    xSpeed = approach(xSpeed,mSpeed,aSpeed * god.gameSpeed);
		}else{
		    xSpeed = approach(xSpeed,0,aSpeed * god.gameSpeed);
		}
		
		moveDir = right - left;

		if(down && (!left && !right)) isCrouching = true;
		else isCrouching = false;
		
		if(passTrough){
			hangPassThroughTime = hangPassThroughTimeMax;
			if(instance_place( x, y+1, parentJumpthru )) jumpThru = noone;
			if(instance_place( x, y, parentJumpthru )) thruPlat = noone;
			else passTrough = false;
		}

		hasTumbled = false;
		halfCombo = false;
		strongAt = false;

		if(parryKeyBuffered && parryActive == false){
		    parryKeyBuffered = 0;
		    parryKeyBufferTimer = 0;
		    parryDur = parryDurMax;
		    //currentState = states.parry;
    
			if(onGround && shield <= 0) shield = shieldMax;
		    parryActive = true;
		}
		
		//Grab
		
		if(itemHold){
			if((up || down || left || right)){
				if(up || down) grabDirY = ((down) - (up)) * (5 * global.sprScale);
				else grabDirY = 0;
	
				if(left || right) grabDirX = ((right) - (left)) * (5 * global.sprScale);
				else grabDirX = 0;
				
				if(!(upHold || downHold || leftHold || rightHold)){
					parryDur = 0;
					parryActive = false;
					shield = 0;
					hitbox_create(-2 * facing*(global.sprScale), -16*(global.sprScale), 26 * facing*(global.sprScale), 10*(global.sprScale), 6, grabDirX, grabDirY, grabStun, grabDam,false, true);
				}
				
				if(isPlayerGrabbed == true){
					grabDur = grabDurMax;
					currentState = states.grab;
				}
			}
		}
		
		//Block
		
		if(wallKeyBuffered && onGround){
			
			if(shield > 0){
				shield -= 1 * god.gameSpeed;
				xSpeed = 0;
			}
		} else if(!itemHold || !onGround){
			shield = 0;
		}
		
		var _bgwall = instance_place(x, y, parentWall);

		if (
		    _bgwall != noone
		    && wallKeyBuffered
		    && canWallGrab
		    && ySpeed > 0   // ← evita agarrarse justo al subir
		) {
		    if (!isWallGrabbing && !onGround) {
		        if (wallGrabTimer == -1) wallGrabTimer = wallGrabMax;
		        isWallGrabbing = true;
		    }
		}
		 else if (_bgwall == noone || _bgwall != prevBgWall || (wallGrabTimer <= 0 && item && !itemHold) || (wallGrabTimer <= 0 && itemHold)){
		    canWallGrab = true;
		    isWallGrabbing = false;
			if (_bgwall != prevBgWall || _bgwall == noone){
				wallGrabLock = -1;
				wallGrabTimer = -1;
			}
		} else if (!itemHold){
		    isWallGrabbing = false;
		}
		
		if(dashed && _bgwall == noone) dashed = false;

		// Handle wall grab behavior
		if (isWallGrabbing) {
			if(!dashed)airDash = false;
			
		    canWallGrab = false;
			
			canJump = true;
			hasSAttWhJump = false;

		    if (wallGrabTimer <= 0 && jumpHold) {
		        isWallGrabbing = false;
		    }
			
			if(ySpeed >= -0.5){
			    //ySpeed = approach(ySpeed, 1, 0.3 * god.gameSpeed);
				tSpeed = 1.2 * (global.sprScale);
			}

    
		    mSpeed = 4 * (global.sprScale);
		}
		
		prevBgWall = _bgwall;

		if(wallGrabTimer == 0){
			if(dashed){
				dashed = false;
				airDash = false;
			}
		    canWallGrab = false;
		    isWallGrabbing = false;
		}


		if(!isWallGrabbing){
			alrWS = false;
			wallTrain = noone;
		    tSpeed = 10 * (global.sprScale);
		    mSpeed = mSpeedDefault;
		}

		if(place_meeting( x, y+1, parentJumpthru) && down && jumpKeyBuffered) passTrough = true;

		if (jumpKeyBuffered && canJump && !passTrough) {
		    jumpKeyBuffered = 0;
		    jumpKeyBufferTimer = 0;
		    canWallGrab = false;
		    isWallGrabbing = false;
		    ySpeed = jPower * jPotent;
		    squash_stretch(0.7,1.3);
		    canJump = false;
		    if(isJump == false) play_sfx(sfxJump, 1, 0);
		    isJump = true;
		}
		
		//Fast fall
		
		if(!onGround && down && (hangPassThroughTime == 0)){
			if(ySpeed > 2 && tSpeed < 34){
				ySpeed += 1;
				tSpeed = 34;
			}
		}

		//jump if you are on the ground and not holding the jump button

		//jump code
		jump_control();

		if((up || down) && (jabCnt > (jabLimit - 3))) halfCombo = true;

		//attack
		
		if(dashKeyBuffered){
			chitTimer = 10;
			
			currentState = states.spAtt;
		}
		
		//change to the attack state and relevant subState based on direction and attack
		if(lattKeyBuffered || hattKeyBuffered){
			
			dashAnt = heavyDashStall[floor(abs(heavyBar - 3))];
			
			smallStAtJumpAct = false;

		    if(lattKeyBuffered){
		        weapon = weapons.dagger;
		        lattKeyBuffered = 0;
		        lattKeyBufferTimer = 0;
		    } else if(!(leftDouble || rightDouble || upDouble || downDouble) && hattKeyBuffered){
		        weapon = weapons.sword;
		        hattKeyBuffered = 0;
		        hattKeyBufferTimer = 0;
		    } else if ((leftDouble || rightDouble || upDouble || downDouble) && hattKeyBuffered){
				weapon = weapons.axe;
				dt_left_timer = 0;
				dt_right_timer = 0;
				dt_up_timer = 0;
				dt_down_timer = 0;
				leftDouble  = false;
				rightDouble = false;
				upDouble    = false;
				downDouble  = false;
		        hattKeyBuffered = 0;
		        hattKeyBufferTimer = 0;
			}
			
			play_sfx(sfxSwoosh, 1, 0);
    
		    weapon_stats();
    
		    //grounded attacks

		    if(onGround){
		        if(up){
		            subState = attacks.up_ground;
		            squash_stretch(0.7,1.3);
		            cxHit = upAtX;
		            cyHit = upAtY;
		            chitTimer = upAtT;
		        }else if(down){
		            subState = attacks.down_ground;
		            squash_stretch(0.7,1.3);
		            cxHit = downAtX;
		            cyHit = downAtY;
		            chitTimer = downAtT;
		        }else{
		            subState = attacks.side_ground;
		            squash_stretch(1.3,0.7);
		            cxHit = sideAtX;
		            cyHit = sideAtY;
		            chitTimer = sideAtT;
		        }
		    }else{
		        //air attacks
		        if(up){
		            subState = attacks.up_air;
		            squash_stretch(0.7,1.3);
		            cxHit = upAtX;
		            cyHit = upAtY;
		            chitTimer = upAtT;
		        }else if(down){
		            subState = attacks.down_air;
		            squash_stretch(0.7,1.3);
		            cxHit = downAtX;
		            cyHit = downAtY;
		            chitTimer = downAtT;
		        }else{
		            subState = attacks.side_air;
		            squash_stretch(1.3,0.7);
		            cxHit = sideAtX;
		            cyHit = sideAtY;
		            chitTimer = sideAtT;
		        }
		    }
			
			currentState = states.attack;
			
			if (weapon == weapons.sword && heavyBar >= 1) heavyBar -= 1;
			
			//pl_attackState();

			frame_reset();
		}

		//dash

	
		/*if((/*(leftDouble || rightDouble || upDouble || downDouble) || (dashKeyBuffered)) && dashCanCldn <= 0){

		    dashKeyBuffered = 0;
		    dashKeyBufferTimer = 0;
		    //air dash. only dash in the air if airDash is false
		    //set airDash to true if you have dashed in the air
		    isDash = true;
			dashed = true;
		    if(!onGround){
		        if(!airDash){
		            dashDur = dashDurMax;
		            squash_stretch(1.3,0.7);
		            currentState = states.dash;
		            canWallGrab = true;
		        }
		    //ground dash
		    }else if(onGround && !down){
		        dashDur = dashDurMax;
		        squash_stretch(1.3,0.7);
		        currentState = states.dash;
		    }
		}
*/



}
