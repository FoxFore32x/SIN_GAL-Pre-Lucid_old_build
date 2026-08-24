function enum_init() {
	//initialize states, attacks, and weapons.

	enum states {
	    normal,
	    wallRun,
	    dash,
	    attack,
	    dodge,
	    block,
	    tumble,
	    dead,
	    recovery,
		grab
	}

	enum attacks {
	    side_ground,
	    side_air,
	    up_ground,
	    up_air,
	    down_ground,
	    down_air
	}

	enum weapons {
	    sword,
	    dagger,
	    spear,
	    axe
	}
	
	enum characters{
		none,
		teori,
		lamb,
		test
	}

	enum modes{
		story,
		challenge,
		vs,
		training
	}

}
