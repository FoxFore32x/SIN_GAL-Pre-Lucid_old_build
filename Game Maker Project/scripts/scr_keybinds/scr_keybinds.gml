// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function initialize_Keybinds(){
	with (oInput){
			//Player 1
			addKeybind(new BindKB("up1", ord("W")));
			addKeybind(new BindKB("down1", ord("S")));
			addKeybind(new BindKB("left1", ord("A")));
			addKeybind(new BindKB("right1", ord("D")));
			
			addKeybind(new BindKB("jump1", ord("O")));
			addKeybind(new BindKB("dash1", ord("N/A")));
			addKeybind(new BindKB("block1", vk_lshift));
			addKeybind(new BindKB("light1", ord("I")));
			addKeybind(new BindKB("strong1", ord("K")));
			addKeybind(new BindKB("special1", ord("P")));
			addKeybind(new BindKB("pause1", vk_space));
			
			addKeybind(new BindGPB("up1", 0, gp_padu));
			addKeybind(new BindGPB("down1", 0, gp_padd));
			addKeybind(new BindGPB("left1", 0, gp_padl));
			addKeybind(new BindGPB("right1", 0, gp_padr));
			
			addKeybind(new BindGPA("up1", 0, gp_axislv, -0.6));
			addKeybind(new BindGPA("down1", 0, gp_axislv, 0.6));
			addKeybind(new BindGPA("left1", 0, gp_axislh, -0.6));
			addKeybind(new BindGPA("right1", 0, gp_axislh, 0.6));
			
			addKeybind(new BindGPB("jump1", 0, gp_face1));
			addKeybind(new BindGPB("dash1", 0, gp_shoulderr));
			addKeybind(new BindGPB("dash1", 0, gp_shoulderrb));
			addKeybind(new BindGPB("block1", 0, gp_shoulderl));
			addKeybind(new BindGPB("block1", 0, gp_shoulderlb));
			addKeybind(new BindGPB("light1", 0, gp_face3));
			addKeybind(new BindGPB("strong1", 0, gp_face4));
			addKeybind(new BindGPB("special1", 0, gp_face2));
			addKeybind(new BindGPB("pause1", 0, gp_start));
			
			//Player 2
			addKeybind(new BindKB("up2", ord("N/A")));
			addKeybind(new BindKB("down2", ord("N/A")));
			addKeybind(new BindKB("left2", ord("N/A")));
			addKeybind(new BindKB("right2", ord("N/A")));
			
			addKeybind(new BindKB("jump2", ord("N/A")));
			addKeybind(new BindKB("dash2", ord("N/A")));
			addKeybind(new BindKB("block2", ord("N/A")));
			addKeybind(new BindKB("light2", ord("N/A")));
			addKeybind(new BindKB("strong2", ord("N/A")));
			addKeybind(new BindKB("special2", ord("N/A")));
			addKeybind(new BindKB("pause2", ord("N/A")));
			
			addKeybind(new BindGPB("up2", 1, gp_padu));
			addKeybind(new BindGPB("down2", 1, gp_padd));
			addKeybind(new BindGPB("left2", 1, gp_padl));
			addKeybind(new BindGPB("right2", 1, gp_padr));
			
			addKeybind(new BindGPA("up2", 1, gp_axislv, -0.6));
			addKeybind(new BindGPA("down2", 1, gp_axislv, 0.6));
			addKeybind(new BindGPA("left2", 1, gp_axislh, -0.6));
			addKeybind(new BindGPA("right2", 1, gp_axislh, 0.6));
			
			addKeybind(new BindGPB("jump2", 1, gp_face1));
			addKeybind(new BindGPB("dash2", 1, gp_shoulderr));
			addKeybind(new BindGPB("dash2", 1, gp_shoulderrb));
			addKeybind(new BindGPB("block2", 1, gp_shoulderl));
			addKeybind(new BindGPB("block2", 1, gp_shoulderlb));
			addKeybind(new BindGPB("light2", 1, gp_face3));
			addKeybind(new BindGPB("strong2", 1, gp_face4));
			addKeybind(new BindGPB("special2", 1, gp_face2));
			addKeybind(new BindGPB("pause2", 1, gp_start));
			
			//Player 3
			addKeybind(new BindKB("up3", ord("N/A")));
			addKeybind(new BindKB("down3", ord("N/A")));
			addKeybind(new BindKB("left3", ord("N/A")));
			addKeybind(new BindKB("right3", ord("N/A")));
			
			addKeybind(new BindKB("jump3", ord("N/A")));
			addKeybind(new BindKB("dash3", ord("N/A")));
			addKeybind(new BindKB("block3", ord("N/A")));
			addKeybind(new BindKB("light3", ord("N/A")));
			addKeybind(new BindKB("strong3", ord("N/A")));
			addKeybind(new BindKB("special3", ord("N/A")));
			addKeybind(new BindKB("pause3", ord("N/A")));
			
			addKeybind(new BindGPB("up3", 2, gp_padu));
			addKeybind(new BindGPB("down3", 2, gp_padd));
			addKeybind(new BindGPB("left3", 2, gp_padl));
			addKeybind(new BindGPB("right3", 2, gp_padr));
			
			addKeybind(new BindGPA("up3", 2, gp_axislv, -0.6));
			addKeybind(new BindGPA("down3", 2, gp_axislv, 0.6));
			addKeybind(new BindGPA("left3", 2, gp_axislh, -0.6));
			addKeybind(new BindGPA("right3", 2, gp_axislh, 0.6));
			
			addKeybind(new BindGPB("jump3", 2, gp_face1));
			addKeybind(new BindGPB("dash3", 2, gp_shoulderr));
			addKeybind(new BindGPB("dash3", 2, gp_shoulderrb));
			addKeybind(new BindGPB("block3", 2, gp_shoulderl));
			addKeybind(new BindGPB("block3", 2, gp_shoulderlb));
			addKeybind(new BindGPB("light3", 2, gp_face3));
			addKeybind(new BindGPB("strong3", 2, gp_face4));
			addKeybind(new BindGPB("special3", 2, gp_face2));
			addKeybind(new BindGPB("pause3", 2, gp_start));
			
			//Player 4
			addKeybind(new BindKB("up4", ord("N/A")));
			addKeybind(new BindKB("down4", ord("N/A")));
			addKeybind(new BindKB("left4", ord("N/A")));
			addKeybind(new BindKB("right4", ord("N/A")));
			
			addKeybind(new BindKB("jump4", ord("U")));
			addKeybind(new BindKB("dash4", ord("N/A")));
			addKeybind(new BindKB("block4", ord("N/A")));
			addKeybind(new BindKB("light4", ord("N/A")));
			addKeybind(new BindKB("strong4", ord("N/A")));
			addKeybind(new BindKB("special4", ord("N/A")));
			addKeybind(new BindKB("pause4", ord("N/A")));
			
			addKeybind(new BindGPB("up4", 3, gp_padu));
			addKeybind(new BindGPB("down4", 3, gp_padd));
			addKeybind(new BindGPB("left4", 3, gp_padl));
			addKeybind(new BindGPB("right4", 3, gp_padr));
			
			addKeybind(new BindGPA("up4", 3, gp_axislv, -0.6));
			addKeybind(new BindGPA("down4", 3, gp_axislv, 0.6));
			addKeybind(new BindGPA("left4", 3, gp_axislh, -0.6));
			addKeybind(new BindGPA("right4", 3, gp_axislh, 0.6));
			
			addKeybind(new BindGPB("jump4", 3, gp_face1));
			addKeybind(new BindGPB("dash4", 3, gp_shoulderr));
			addKeybind(new BindGPB("dash4", 3, gp_shoulderrb));
			addKeybind(new BindGPB("block4", 3, gp_shoulderl));
			addKeybind(new BindGPB("block4", 3, gp_shoulderlb));
			addKeybind(new BindGPB("light4", 3, gp_face3));
			addKeybind(new BindGPB("strong4", 3, gp_face4));
			addKeybind(new BindGPB("special4", 3, gp_face2));
			addKeybind(new BindGPB("pause4", 3, gp_start));
	}
}

function globalKeys() {
	
	//Player 1
	global.keyUp[0] = inputCheckHeld("up1");
	global.keyDown[0] = inputCheckHeld("down1");
	global.keyLeft[0] = inputCheckHeld("left1");
	global.keyRight[0] = inputCheckHeld("right1");
	global.keyUp2[0] = inputCheckPressed("up1");
	global.keyDown2[0] = inputCheckPressed("down1");
	global.keyLeft2[0] = inputCheckPressed("left1");
	global.keyRight2[0] = inputCheckPressed("right1");
	global.keyUp3[0] = inputCheckReleased("up1");
	global.keyDown3[0] = inputCheckReleased("down1");
	global.keyLeft3[0] = inputCheckReleased("left1");
	global.keyRight3[0] = inputCheckReleased("right1");
	global.keyJump[0] = inputCheckHeld("jump1");
	global.keyJump2[0] = inputCheckPressed("jump1");
	global.keyJump3[0] = inputCheckReleased("jump1");
	global.keyDash[0] = inputCheckHeld("dash1");
	global.keyBlock[0] = inputCheckHeld("block1");
	global.keyLight[0] = inputCheckHeld("light1");
	global.keyLight2[0] = inputCheckPressed("light1");
	global.keyStrong[0] = inputCheckHeld("strong1");
	global.keySpecial[0] = inputCheckHeld("special1");
	global.keyPause[0] = inputCheckHeld("pause1");
	global.keyPause2[0] = inputCheckPressed("pause1");
	global.keyPause3[0] = inputCheckReleased("pause1");
	global.keyAny[0] = (inputCheckPressed("up1") || inputCheckPressed("down1") || 
	inputCheckPressed("left1") || inputCheckPressed("right1") || 
	inputCheckPressed("up1") || inputCheckPressed("jump1") ||
	inputCheckPressed("dash1") || inputCheckPressed("block1") || 
	inputCheckPressed("light1") || inputCheckPressed("strong1") ||
	inputCheckPressed("special1") || inputCheckPressed("pause1"));
	
	//Player 2
	global.keyUp[1] = inputCheckHeld("up2");
	global.keyDown[1] = inputCheckHeld("down2");
	global.keyLeft[1] = inputCheckHeld("left2");
	global.keyRight[1] = inputCheckHeld("right2");
	global.keyUp2[1] = inputCheckPressed("up2");
	global.keyDown2[1] = inputCheckPressed("down2");
	global.keyLeft2[1] = inputCheckPressed("left2");
	global.keyRight2[1] = inputCheckPressed("right2");
	global.keyUp3[1] = inputCheckReleased("up2");
	global.keyDown3[1] = inputCheckReleased("down2");
	global.keyLeft3[1] = inputCheckReleased("left2");
	global.keyRight3[1] = inputCheckReleased("right2");
	global.keyJump[1] = inputCheckHeld("jump2");
	global.keyJump2[1] = inputCheckPressed("jump2");
	global.keyJump3[1] = inputCheckReleased("jump2");
	global.keyDash[1] = inputCheckHeld("dash2");
	global.keyBlock[1] = inputCheckHeld("block2");
	global.keyLight[1] = inputCheckHeld("light2");
	global.keyLight2[1] = inputCheckPressed("light2");
	global.keyStrong[1] = inputCheckHeld("strong2");
	global.keySpecial[1] = inputCheckHeld("special2");
	global.keyPause[1] = inputCheckHeld("pause2");
	global.keyPause2[1] = inputCheckPressed("pause2");
	global.keyPause3[1] = inputCheckReleased("pause2");
	global.keyAny[1] = (inputCheckPressed("up2") || inputCheckPressed("down2") || 
	inputCheckPressed("left2") || inputCheckPressed("right2") || 
	inputCheckPressed("up2") || inputCheckPressed("jump2") ||
	inputCheckPressed("dash2") || inputCheckPressed("block2") || 
	inputCheckPressed("light2") || inputCheckPressed("strong2") ||
	inputCheckPressed("special2") || inputCheckPressed("pause2"));
	
	//Player 3
	global.keyUp[2] = inputCheckHeld("up3");
	global.keyDown[2] = inputCheckHeld("down3");
	global.keyLeft[2] = inputCheckHeld("left3");
	global.keyRight[2] = inputCheckHeld("right3");
	global.keyUp2[2] = inputCheckPressed("up3");
	global.keyDown2[2] = inputCheckPressed("down3");
	global.keyLeft2[2] = inputCheckPressed("left3");
	global.keyRight2[2] = inputCheckPressed("right3");
	global.keyUp3[2] = inputCheckReleased("up3");
	global.keyDown3[2] = inputCheckReleased("down3");
	global.keyLeft3[2] = inputCheckReleased("left3");
	global.keyRight3[2] = inputCheckReleased("right3");
	global.keyJump[2] = inputCheckHeld("jump3");
	global.keyJump2[2] = inputCheckPressed("jump3");
	global.keyJump3[2] = inputCheckReleased("jump3");
	global.keyDash[2] = inputCheckHeld("dash3");
	global.keyBlock[2] = inputCheckHeld("block3");
	global.keyLight[2] = inputCheckHeld("light3");
	global.keyLight2[2] = inputCheckPressed("light3");
	global.keyStrong[2] = inputCheckHeld("strong3");
	global.keySpecial[2] = inputCheckHeld("special3");
	global.keyPause[2] = inputCheckHeld("pause3");
	global.keyPause2[2] = inputCheckPressed("pause3");
	global.keyPause3[2] = inputCheckReleased("pause3");
	global.keyAny[2] = (inputCheckPressed("up3") || inputCheckPressed("down3") || 
	inputCheckPressed("left3") || inputCheckPressed("right3") || 
	inputCheckPressed("up3") || inputCheckPressed("jump3") ||
	inputCheckPressed("dash3") || inputCheckPressed("block3") || 
	inputCheckPressed("light3") || inputCheckPressed("strong3") ||
	inputCheckPressed("special3") || inputCheckPressed("pause3"));
	
	//Player 4
	global.keyUp[3] = inputCheckHeld("up4");
	global.keyDown[3] = inputCheckHeld("down4");
	global.keyLeft[3] = inputCheckHeld("left4");
	global.keyRight[3] = inputCheckHeld("right4");
	global.keyUp2[3] = inputCheckPressed("up4");
	global.keyDown2[3] = inputCheckPressed("down4");
	global.keyLeft2[3] = inputCheckPressed("left4");
	global.keyRight2[3] = inputCheckPressed("right4");
	global.keyUp3[3] = inputCheckReleased("up4");
	global.keyDown3[3] = inputCheckReleased("down4");
	global.keyLeft3[3] = inputCheckReleased("left4");
	global.keyRight3[3] = inputCheckReleased("right4");
	global.keyJump[3] = inputCheckHeld("jump4");
	global.keyJump2[3] = inputCheckPressed("jump4");
	global.keyJump3[3] = inputCheckReleased("jump4");
	global.keyDash[3] = inputCheckHeld("dash4");
	global.keyBlock[3] = inputCheckHeld("block4");
	global.keyLight[3] = inputCheckHeld("light4");
	global.keyLight2[3] = inputCheckPressed("light4");
	global.keyStrong[3] = inputCheckHeld("strong4");
	global.keySpecial[3] = inputCheckHeld("special4");
	global.keyPause[3] = inputCheckHeld("pause4");
	global.keyPause2[3] = inputCheckPressed("pause4");
	global.keyPause3[3] = inputCheckReleased("pause4");
	global.keyAny[3] = (inputCheckPressed("up4") || inputCheckPressed("down4") || 
	inputCheckPressed("left4") || inputCheckPressed("right4") || 
	inputCheckPressed("up4") || inputCheckPressed("jump4") ||
	inputCheckPressed("dash4") || inputCheckPressed("block4") || 
	inputCheckPressed("light4") || inputCheckPressed("strong4") ||
	inputCheckPressed("special4") || inputCheckPressed("pause4"));
	
	global.keyUpAll = (global.keyUp[0] || global.keyUp[1] || global.keyUp[2] || global.keyUp[3] || keyboard_check(vk_up));
	global.keyDownAll = (global.keyDown[0] || global.keyDown[1] || global.keyDown[2] || global.keyDown[3]  || keyboard_check(vk_down));
	global.keyLeftAll = (global.keyLeft[0] || global.keyLeft[1] || global.keyLeft[2] || global.keyLeft[3] || keyboard_check(vk_left));
	global.keyRightAll = (global.keyRight[0] || global.keyRight[1] || global.keyRight[2] || global.keyRight[3] || keyboard_check(vk_right));
	global.keyUp2All = (global.keyUp2[0] || global.keyUp2[1] || global.keyUp2[2] || global.keyUp2[3] || keyboard_check_pressed(vk_up));
	global.keyDown2All = (global.keyDown2[0] || global.keyDown2[1] || global.keyDown2[2] || global.keyDown2[3] || keyboard_check_pressed(vk_down));
	global.keyLeft2All = (global.keyLeft2[0] || global.keyLeft2[1] || global.keyLeft2[2] || global.keyLeft2[3] || keyboard_check_pressed(vk_left));
	global.keyRight2All = (global.keyRight2[0] || global.keyRight2[1] || global.keyRight2[2] || global.keyRight2[3] || keyboard_check_pressed(vk_right));
	global.keyUp3All = (global.keyUp3[0] || global.keyUp3[1] || global.keyUp3[2] || global.keyUp3[3] || keyboard_check_released(vk_up));
	global.keyDown3All = (global.keyDown3[0] || global.keyDown3[1] || global.keyDown3[2] || global.keyDown3[3] || keyboard_check_released(vk_down));
	global.keyLeft3All = (global.keyLeft3[0] || global.keyLeft3[1] || global.keyLeft3[2] || global.keyLeft3[3] || keyboard_check_released(vk_left));
	global.keyRight3All = (global.keyRight3[0] || global.keyRight3[1] || global.keyRight3[2] || global.keyRight3[3] || keyboard_check_released(vk_right));
	global.keyJumpAll = (global.keyJump[0] || global.keyJump[1] || global.keyJump[2] || global.keyJump[3] || keyboard_check(vk_enter));
	global.keyJump2All = (global.keyJump2[0] || global.keyJump2[1] || global.keyJump2[2] || global.keyJump2[3] || keyboard_check_pressed(vk_enter));
	global.keyJump3All = (global.keyJump3[0] || global.keyJump3[1] || global.keyJump3[2] || global.keyJump3[3] || keyboard_check_released(vk_enter));
	global.keyDashAll = global.keyDash[0] || global.keyDash[1] || global.keyDash[2] || global.keyDash[3];
	global.keyBlockAll = global.keyBlock[0] || global.keyBlock[1] || global.keyBlock[2] || global.keyBlock[3];
	global.keyLightAll = (global.keyLight[0] || global.keyLight[1] || global.keyLight[2] || global.keyLight[3] || keyboard_check(vk_backspace));
	global.keyLight2All = (global.keyLight2[0] || global.keyLight2[1] || global.keyLight2[2] || global.keyLight2[3] || keyboard_check_pressed(vk_backspace));
	global.keyStrongAll = global.keyStrong[0] || global.keyStrong[1] || global.keyStrong[2] || global.keyStrong[3];
	global.keySpecialAll = global.keySpecial[0] || global.keySpecial[1] || global.keySpecial[2] || global.keySpecial[3];
	global.keyPauseAll = global.keyPause[0] || global.keyPause[1] || global.keyPause[2] || global.keyPause[3];
	global.keyPause2All = global.keyPause2[0] || global.keyPause2[1] || global.keyPause2[2] || global.keyPause2[3];
	global.keyPause3All = global.keyPause3[0] || global.keyPause3[1] || global.keyPause3[2] || global.keyPause3[3];
	global.keyAnyAll = global.keyAny[0] || global.keyAny[1] || global.keyAny[2] || global.keyAny[3];
}