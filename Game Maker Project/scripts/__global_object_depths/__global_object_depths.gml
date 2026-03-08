function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // oCamera
	global.__objectDepths[1] = 0; // god
	global.__objectDepths[2] = 50; // parentBlocker
	global.__objectDepths[3] = 50; // parentJumpthru
	global.__objectDepths[4] = 0; // parentPhysics
	global.__objectDepths[5] = 50; // parentWall
	global.__objectDepths[6] = 0; // parentWarp
	global.__objectDepths[7] = 0; // oWarpController
	global.__objectDepths[8] = 0; // parentWarpGoal
	global.__objectDepths[9] = 0; // parentTrigger
	global.__objectDepths[10] = 0; // oPlayer
	global.__objectDepths[11] = -1; // oHitbox
	global.__objectDepths[12] = -1; // oHurtbox
	global.__objectDepths[13] = 0; // oTitle
	global.__objectDepths[14] = 0; // oOptions
	global.__objectDepths[15] = 0; // oResults
	global.__objectDepths[16] = 0; // oDoor
	global.__objectDepths[17] = 0; // oCard
	global.__objectDepths[18] = 0; // oButt
	global.__objectDepths[19] = 60; // tut1
	global.__objectDepths[20] = 60; // tut2
	global.__objectDepths[21] = 60; // tut3


	global.__objectNames[0] = "oCamera";
	global.__objectNames[1] = "god";
	global.__objectNames[2] = "parentBlocker";
	global.__objectNames[3] = "parentJumpthru";
	global.__objectNames[4] = "parentPhysics";
	global.__objectNames[5] = "parentWall";
	global.__objectNames[6] = "parentWarp";
	global.__objectNames[7] = "oWarpController";
	global.__objectNames[8] = "parentWarpGoal";
	global.__objectNames[9] = "parentTrigger";
	global.__objectNames[10] = "oPlayer";
	global.__objectNames[11] = "oHitbox";
	global.__objectNames[12] = "oHurtbox";
	global.__objectNames[13] = "oTitle";
	global.__objectNames[14] = "oOptions";
	global.__objectNames[15] = "oResults";
	global.__objectNames[16] = "oDoor";
	global.__objectNames[17] = "oCard";
	global.__objectNames[18] = "oButt";
	global.__objectNames[19] = "tut1";
	global.__objectNames[20] = "tut2";
	global.__objectNames[21] = "tut3";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
