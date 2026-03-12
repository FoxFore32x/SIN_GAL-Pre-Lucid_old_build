function dagger_attacks() {
	//create hitboxes based on specific frames during the attack
	//and position the hitbox relative to the current weapon and attack
	switch(subState){
	    case attacks.side_ground:
	    case attacks.side_air:
	        if(frame_check(1,1)){
	            invFrames = 2;
	            hitbox_create(0*facing*(global.sprScale),-21*(global.sprScale),25*facing*(global.sprScale),10*(global.sprScale),3,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),80,10);
	        }
	    break;
    
	    case attacks.up_ground:
	    case attacks.up_air:
	        if(frame_check(1,1)){
	            invFrames = 2;
	            hitbox_create(-8*facing*(global.sprScale),-40*(global.sprScale),18*facing*(global.sprScale),25*(global.sprScale),3,cxHit*facing*(global.sprScale),cyHit*(global.sprScale),60,10);
	        }        
	    break;
    
	    case attacks.down_ground:
	    case attacks.down_air:
	        if(frame_check(1,1)){
	            invFrames = 2;
	            hitbox_create(5*facing*(global.sprScale),-11*(global.sprScale),17*facing*(global.sprScale),23*(global.sprScale),3,(cxHit+1)*facing*(global.sprScale),cyHit*(global.sprScale),60,10);
	        }  
	    break;
	}



}
