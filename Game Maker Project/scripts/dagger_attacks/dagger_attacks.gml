function dagger_attacks() {
	//create hitboxes based on specific frames during the attack
	//and position the hitbox relative to the current weapon and attack
	switch(subState){
	    case attacks.side_ground:
	    case attacks.side_air:
	        if(frame_check(1,1)){
	            invFrames = 2;
	            hitbox_create(hitOffX*facing*(global.sprScale),hitOffY*(global.sprScale),hitWidth*facing*(global.sprScale),hitHeight*(global.sprScale),hitDur,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),80,15,false);
	        }
	    break;
    
	    case attacks.up_ground:
	    case attacks.up_air:
	        if(frame_check(1,1)){
	            invFrames = 2;
	            hitbox_create(hitOffX*facing*(global.sprScale),hitOffY*(global.sprScale),hitWidth*facing*(global.sprScale),hitHeight*(global.sprScale),hitDur,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),60,10,false);
	        }        
	    break;
    
	    case attacks.down_ground:
	    case attacks.down_air:
	        if(frame_check(1,1)){
	            invFrames = 2;
	            hitbox_create(hitOffX*facing*(global.sprScale),hitOffY*(global.sprScale),hitWidth*facing*(global.sprScale),hitHeight*(global.sprScale),hitDur,(cxHit+1)*facing*(global.sprScale),cyHit*(global.sprScale),60,10,false);
	        }  
	    break;
	}



}
