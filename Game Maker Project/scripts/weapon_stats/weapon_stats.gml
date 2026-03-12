function weapon_stats() {
	//set sprites and frame data based on current weapon

	switch(weapon){
	    //sword
	    case weapons.sword:
	        canCharge = false;
	        idleSprite   = sprPlayer_Idle_Base;
	        weaponIdle   = sprSword_Idle;
	        weaponRun    = sprSword_Run;
	        weaponJump   = sprSword_Jump;
	        weaponSprite = sprSword_Idle;
	        sideSpriteG  = sprSword_Attack_Side_G;
	        sideSpriteA  = sprSword_Attack_Side_A;
	        upSpriteG    = sprSword_Attack_Up_G;
	        upSpriteA    = sprSword_Attack_Up_A;
	        downSpriteG  = sprSword_Attack_Down_G;
	        downSpriteA  = sprSword_Attack_Down_A;
	        fd_side      = fd_sword_side;
	        fd_up        = fd_sword_up;
	        fd_down      = fd_sword_down;
        
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
	    break;
    
	    //dagger
	    case weapons.dagger:
	        canCharge = false;
	        idleSprite   = sprDagger_Idle;
	        weaponIdle   = sprDagger_Idle;
	        weaponRun    = sprDagger_Run;
	        weaponJump   = sprDagger_Jump;
	        weaponSprite = sprDagger_Idle;
	        sideSpriteG  = sprDagger_Attack_Side_G;
	        sideSpriteA  = sprDagger_Attack_Side_A;
	        upSpriteG    = sprDagger_Attack_Up_G;
	        upSpriteA    = sprDagger_Attack_Up_A;
	        downSpriteG  = sprDagger_Attack_Down_G;
	        downSpriteA  = sprDagger_Attack_Down_A;
	        fd_side      = fd_dagger_side;
	        fd_up        = fd_dagger_up;
	        fd_down      = fd_dagger_down;
        
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
	    break;
    
	    //axe
	    case weapons.axe:
	        canCharge = false;
	        idleSprite   = sprAxe_Idle;
	        weaponIdle   = sprAxe_Idle;
	        weaponRun    = sprAxe_Run;
	        weaponJump   = sprAxe_Jump;
	        weaponSprite = sprAxe_Idle;
	        sideSpriteG  = sprAxe_Attack_Side_G;
	        sideSpriteA  = sprAxe_Attack_Side_A;
	        upSpriteG    = sprAxe_Attack_Up_G;
	        upSpriteA    = sprAxe_Attack_Up_A;
	        downSpriteG  = sprAxe_Attack_Down_G;
	        downSpriteA  = sprAxe_Attack_Down_A;
	        fd_side      = fd_axe_side;
	        fd_up        = fd_axe_up;
	        fd_down      = fd_axe_down;
	    break;
    
	    //spear
	    case weapons.spear:
	        canCharge = false;
	        idleSprite   = sprSpear_Idle;
	        weaponIdle   = sprSpear_Idle;
	        weaponRun    = sprSpear_Run;
	        weaponJump   = sprSpear_Jump;
	        weaponSprite = sprSpear_Idle;
	        sideSpriteG  = sprSpear_Attack_Side_G;
	        sideSpriteA  = sprSpear_Attack_Side_A;
	        upSpriteG    = sprSpear_Attack_Up_G;
	        upSpriteA    = sprSpear_Attack_Up_A;
	        downSpriteG  = sprSpear_Attack_Down_G;
	        downSpriteA  = sprSpear_Attack_Down_A;
	        fd_side      = fd_spear_side;
	        fd_up        = fd_spear_up;
	        fd_down      = fd_spear_down;
	    break;
	}



}
