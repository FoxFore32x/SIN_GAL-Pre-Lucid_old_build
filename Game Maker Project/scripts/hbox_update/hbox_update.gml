function hbox_update() {
	//updates coordiates of hurtboxes and hitboxes based on offset from x / y sprite origins
	with(hurtbox){
	    x = owner.x + xOffset;
	    y = owner.y + yOffset;
	    if(owner.isCrouching || (owner.currentState = states.tumble && owner.onGround
	    && owner.hasTumbled)){
	        yOffset = -11*(global.sprScale);
	        yScale = 11*(global.sprScale);
	    }
	    else{
	        yOffset = -22*(global.sprScale)
	        y = owner.y + yOffset;
	        yScale = 22*(global.sprScale);
	    }
    
	}

	if(hitbox != -1){
	    with(hitbox){
	        x = owner.x + xOffset;
	        y = owner.y + yOffset;    
	    }
	}



}
