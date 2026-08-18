// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function pl_timers(){
	if(dashCanCldn > 0) dashCanCldn -= 1 * god.gameSpeed;
	
	if (parryDur > 0) parryDur -= 1 * god.gameSpeed;
	else {
		canPlay = true;
		parryActive = false;
		parried = false;
	}
	
	if(comboCnt >= 1 && comboTimer > 0){
		isCombing = true;
		comboTimer -= 1 * god.gameSpeed;
	} else {
		isCombing = false;
		comboCnt = 0;
		jabCnt = 0;
	}
	
	if(heavyBar < heavyBarMax){
		heavyBar += heavyIncrease * god.gameSpeed;
	}
	
	if(heavyBar > heavyBarMax){
		heavyBar = 3;
	}
	
	if(heavyBar <= 1){
		tired = true;	
	} else {
		tired = false;
	}
	
	if(hangPassThroughTime > 0){
		hangPassThroughTime -= 1 * god.gameSpeed;
	}
}