function pl_endStep() {
	//inherit code from parent
	event_inherited();

	//run code based on players current state
	switch(currentState){
	    case states.normal:
	        pl_normalState();
	    break;
    
	    case states.attack:
	        pl_attackState();
	    break;
    
	    case states.dash:
	        pl_dashState();
	    break;
    
	    case states.recovery:
	        pl_recoveryState();
	    break;
    
	    case states.tumble:
	        pl_tumbleState();
	    break;
	}

	// HIT
	//if (hit && instance_exists(hitBy) && !parried && !invins) {
	var hitCount = ds_list_size(hitQueue);

	if(hit){
	    for (var i = 0; i < hitCount; i++) {
    
	        var hb = hitQueue[| i];
	        if (!instance_exists(hb)) continue;
	        if (!instance_exists(hb.owner)) continue;
	        oHitBy = hb.owner;
        
	        if(parryActive && parryDur > 0){
	            parried = true;
	            if(canPlay){
	                play_sfx(sfxParry, 1, 0);
	                canPlay = false;
	            }
	            god.shake  = true;
	            freeze = freezeHLim;
                
	            if(parryDur >= perParryTim) hb.owner.hitStun = perParryHS;
	            else hb.owner.hitStun = parryHitStun;
                
	            hb.owner.currentState = states.tumble;
            
	            if(currentState == states.dash){
	                xSpeed /= 1.3;
	                ySpeed /= 1.3;
	                dashDur = 0;
	                dashAnt = dashAntLimit;
	                willDash = false;
	                tSpeed = 10 * (global.sprScale);
	                isDash = false;
	                state_reset();
	            }
            
	            //count down dashDur and reset state to normal when dashDur reaches 0
	        }
        
	        if (parried || invins) continue;
        
	        isCrouching = false;
        
	        // hit logic
	        // Now it's safe to check the hitter
			if(!hb.obstacle){
		        var cpu_hitter_in_arcade = false;
        
		        if (global.arcadeMode) {
		            if (hb.owner.player < 0 && player < 0) {
		                cpu_hitter_in_arcade = true;
		            }
		        }
        
		        if (cpu_hitter_in_arcade) {
		            hit = false;
		            exit; // Stop hit processing
		        }
			}
        
	        if(global.opHp){
				if(!shield){
					hp -= hb.damage;
					
					if((prevDam != 0) && (prevDam < hb.damage)) hitStun += 50;
					else if ((prevDam != 0) && (prevDam > hb.damage)) hitStun -= 50;
					prevDam = hb.damage;
				}
	            if (hp <= 0){
	                if(dead == false){
	                    global.existentPl -= 1;
	                    global.winId[global.winnerVar] = plId + 1;
	                    global.winnerVar++;
                    
	                    if(global.existentPl <= 1 && !hb.obstacle && instance_exists(oHitBy))
	                    global.winId[global.winnerVar] = oHitBy.plId + 1;
	                }
	                dead = true;
	            }
            
	            if (dead) {
	                // SAFELY destroy the hitbox first, if it exists
	                if (instance_exists(hitbox)) {
	                    with (hitbox) destroy = true;
	                }
            
	                // After hitbox is cleared, destroy the hurtbox
	                if (instance_exists(hurtbox)) {
	                    instance_destroy(hurtbox);
	                }
					if(isBoss) global.arPlWon = true;
	            }
	        }
    
	        squash_stretch(1.5,1.5);
	        /*hb.owner.jabCnt++;
	        hb.owner.comboCnt++;
	        hb.owner.comboTimer = hb.owner.comboTimerLimit;*/
			
			weaponSprite = sprEmpty;
        
	        pl_hitReset();
			
			if(!hb.obstacle){
        
		        if (!hb.comboGranted) {
		            hb.comboGranted = true;
        
					if(!hb.owner.isDash){
						if(hb.owner.weapon == weapons.sword) hb.owner.hJabCnt++;
			            else hb.owner.jabCnt++;
					}
            
		            hb.owner.comboCnt++;
		            hb.owner.comboTimer = hb.owner.comboTimerLimit;
            
		            if(hb.owner.weapon == weapons.sword ||
		            (hb.owner.jabCnt > hb.owner.jabLimit)
		            || halfCombo == true) play_sfx(sfxPnch1, 1, 0);
		            else play_sfx(sfxPnch1low, 1, 0);
		        }
        
		        if(!hb.owner.onGround && !onGround){
		            hb.owner.tSpeed = 0;
		            atFloatTim = hb.owner.chitTimer;
            
		        }
        
		        if(hb.owner.jabCnt > (hb.owner.jabLimit / 2)){
		            if ((hb.owner.subState == attacks.down_ground
		                || hb.owner.subState == attacks.down_air) && onGround){
		                    halfCombo = true;
		                    downGroundHit = true;
		                }
            
		            if ((hb.owner.subState == attacks.up_ground
		                || hb.owner.subState == attacks.up_air)){
		                    halfCombo = true;
		                }
                
		        }
        
		        if((hb.owner.jabCnt > hb.owner.jabLimit) 
		        || (hb.owner.hJabCnt > hb.owner.hJabLimit)
				|| (hb.owner.hJabCnt > 0 && hb.owner.jabCnt > 0 && hb.owner.weapon == weapons.sword)
		        || halfCombo == true){
		            switch(hb.owner.subState){
		                case attacks.up_ground:
		                    hb.xHit = hb.owner.upAtSX * hb.owner.facing*(global.sprScale);
		                    hb.yHit = hb.owner.upAtSY*(global.sprScale);
		                    hb.owner.chitTimer = hb.owner.upAtST;
		                break;
                    
		                case attacks.down_ground:
		                    hb.xHit = hb.owner.downAtSX * hb.owner.facing*(global.sprScale);
		                    hb.yHit = hb.owner.downAtSY*(global.sprScale);
		                    hb.owner.chitTimer = hb.owner.downAtST;
		                break;
                    
		                case attacks.side_ground:
		                    hb.xHit = hb.owner.sideAtSX * hb.owner.facing*(global.sprScale);
		                    hb.yHit = hb.owner.sideAtSY*(global.sprScale);
		                    hb.owner.chitTimer = hb.owner.sideAtST;
		                break;
                
		                case attacks.up_air:
		                    hb.xHit = hb.owner.upAtSX * hb.owner.facing*(global.sprScale);
		                    hb.yHit = hb.owner.upAtSY*(global.sprScale);
		                    hb.owner.chitTimer = hb.owner.upAtST;
		                break;
                    
		                case attacks.down_air:
		                    hb.xHit = hb.owner.downAtSX * hb.owner.facing*(global.sprScale);
		                    hb.yHit = hb.owner.downAtSY*(global.sprScale);
		                    hb.owner.chitTimer = hb.owner.downAtST;
		                break;
                    
		                case attacks.side_air:
		                    hb.xHit = hb.owner.sideAtSX * hb.owner.facing*(global.sprScale);
		                    hb.yHit = hb.owner.sideAtSY*(global.sprScale);
		                    hb.owner.chitTimer = hb.owner.sideAtST;
		                break;
		            }
		            hb.owner.jabCnt = 0;
		            hb.owner.hJabCnt = 0;
		            hb.owner.canWallGrab = true;
		            hb.owner.wallGrabTimer = hb.owner.wallGrabMax;
		            freeze = freezeHLim;
		            hb.owner.freeze = freezeHLim;
		            hasTumbled = true;
            
		            god.shake  = true;
		            //god.freeze = true;
		        } else {
		            freeze = freezeLLim;
		            hb.owner.freeze = freezeLLim;
		        }
        
		        if (hb.owner.xSpeed == 0 && !hb.owner.onGround){
		            hb.owner.xSpeed = 1 * hb.owner.facing;
		        }
			} else {
				hasTumbled = true;
		        god.shake  = true;
				freeze = freezeLLim;
		        hb.owner.freeze = freezeLLim;
				play_sfx(sfxPnch1low, 1, 0);
			}
			if(shield){
				xSpeed = hb.xHit / 3;
        
		        facing = hb.owner.facing * -1;
		        depth = hb.depth;
				
			} else {
				y --;
				
				xSpeed = hb.xHit;
        
		        if(!downGroundHit) ySpeed = hb.yHit;
		        else ySpeed = -4;
        
		        facing = hb.owner.facing * -1;
		        depth = hb.depth;
		        hitStun = hb.hitStun;
        
		        currentState = states.tumble;
			}
    
	        downGroundHit = false;
	        halfCombo = false;
        
	        hit = false;
	    }
	}

	//update hitbox position
	hbox_update();

	//animation control
	pl_animation();

	//destroy
	pl_destroy();




}
