function action_up_down(p, heightDiff){
	if(irandom_range(0, 100) < 2 || (irandom_range(0, 100) < 20 && (p.isCrouching
	|| -heightDiff >= 10 * global.sprScale))){
	    down = true;
	} else down = false;

	if(heightDiff >= 10 * global.sprScale && irandom_range(0, 100) < 20){
	    up = true;
	} else up = false;
}

function pl_cpu() {
	// --- Basic CPU controller ---
	if (player >= 0 || immobile) exit; //player < 0 = CPUS, >= 0 Players

	jumpKeyBuffered = 0;
	parryKeyBuffered = 0;
	wallKeyBuffered = 0;
	dashKeyBuffered = 0;
	lattKeyBuffered = 0;
	hattKeyBuffered = 0;

	var nearest = noone;
	var nearestDist = room_width;

	with (oPlayer) {
	    if (id != other.id && !dead && ( !global.arcadeMode || player >= 0)) {
	        var dist = point_distance(other.x, other.y, x, y);
	        if (dist < nearestDist) {
	            nearestDist = dist;
	            nearest = id;
	        }
	    }
	}

	var p = nearest;
	if (p == noone) exit;

	// ###Horizontal movement
	if (walkPause > 0) walkPause -= 1 * god.gameSpeed;

	if (parryPause > 0) parryPause -= 1 * god.gameSpeed;

	// Determine how long to hold jump depending on how far above the player is
	var heightDiff = abs(p.y - y) * global.sprScale;
	var widthDiff = abs(p.x - x) * global.sprScale;

	if (walkPause <= 0) {
	    var dist = sign(p.x - x);

	    if (dist < 0) {
	        left  = true;
	        right = false;
	    } else if (dist > 0) {
	        left  = false;
	        right = true;
	    } else {
	        left  = false;
	        right = false;
	    }

	    // Occasionally decide to pause for a bit
	    if (irandom_range(0, 100) < 5 && !(widthDiff <= 30 * global.sprScale)) { // 30% chance to stop for a moment
	        walkPause = irandom_range(10, 20); // pause 10–20 frames
	        left = false;
	        right = false;
	    }
	}

	action_up_down(p, heightDiff);

	// --- Jump if player is above ---
	if (widthDiff <= 40 * global.sprScale && heightDiff >= 15 * global.sprScale && (irandom_range(0, 100) < 60) && canJump
	    && hitStun <= 0) {
	    jumpKeyBuffered = 1;

	    if (heightDiff > 30 * global.sprScale) {
	        jump = true;   // hold longer for high platforms
	    } else {
	        jump = false;  // small tap for short hops
	    }
	}

	//STAGE OBJECT COLLISIONS:

	//JumpThru
	if(-heightDiff > 10 * global.sprScale && place_meeting( x, y+1, parentJumpthru) && irandom_range(0, 100) < 20){
	    passTrough = true;
	}

	//BGWall
	if(place_meeting(x, y, parentWall) && irandom_range(0, 100) < 40){
	    wallKeyBuffered = 1;
	}

	// Attack
	if (attackCooldown > 0) attackCooldown -= 1 * god.gameSpeed; // count down each frame

	if (widthDiff <= 8 * global.sprScale || ( widthDiff <= 3 * global.sprScale && (-heightDiff > 3 * global.sprScale || heightDiff > 3 * global.sprScale )) && attackCooldown <= 0 && hitStun <= 0) {
	    // randomly pick light or heavy attack
	    if (irandom_range(0, 100) < 30) {
	        if (irandom(1) == 0) {
	            lattKeyBuffered = 1;
	        } else {
	            hattKeyBuffered = 1;
	        }
	        attackCooldown = 20; // Cooldown before next attack
	    }
	}

	// Simple parry chance
	if (p.currentState == states.attack) {
    
	    if(irandom_range(0, 100) < 2
	    && !parryActive
	    && parryPause <= 0){
	        parryKeyBuffered = 1;
	        parryPause = irandom_range(60, 240); // frames (will be decremented each step)
	    }
	}

	// Tumble recover code
	if (!dead && hitStun > 0 && irandom_range(0, 100) < 5){
	    jumpKeyBuffered = 1;
	}

	// Dash
	if ((widthDiff >= 30 * global.sprScale || heightDiff >= 140 * global.sprScale) && (irandom_range(0, 100) < 3)) {
	    action_up_down(p, heightDiff);
		dashKeyBuffered = 1;
	}

}
