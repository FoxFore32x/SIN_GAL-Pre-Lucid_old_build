function sword_attacks() {
	//create hitboxes based on specific frames during the attack
	//and position the hitbox relative to the current weapon and attack
	switch(subState){    
	    case attacks.side_ground:
	    case attacks.side_air:
	        if(frame_check(1,2)){
	            invFrames = 4;
	            hitbox_create(-8*facing*(global.sprScale),-23*(global.sprScale),35*facing*(global.sprScale),12*(global.sprScale),6,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),100,10);
	        }
	    break;
    
	    case attacks.up_ground:
	    case attacks.up_air:
	        if(frame_check(1,2)){
	            invFrames = 4;
	            hitbox_create(-12*facing*(global.sprScale),-37*(global.sprScale),30*facing*(global.sprScale),22*(global.sprScale),6,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),100,10);
	        }        
	    break;
    
	    case attacks.down_ground:
	    case attacks.down_air:
	        if(frame_check(1,2)){
	            invFrames = 4;
	            hitbox_create(-12*facing*(global.sprScale),-14*(global.sprScale),24*facing*(global.sprScale),30*(global.sprScale),6,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),100,10);
	        }  
	    break;
	}



}
