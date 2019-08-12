extends Sprite

var Dia_TimyIntroduction = "res://DialougFiles/TimmyIntro.tres"
var Dia_TimyIsFat = "res://DialougFiles/TimmyWantsFood.tres"
var Dia_TimyThanksYou = "res://DialougFiles/TimyThanks.tres"
var Dia_TimyThanksYouAgain = "res://DialougFiles/TimyThanksAgain.tres"
var VarDia_TmmyFirstTime = true
var VarDia_TimmyIsHungry = false
var VarDia_FoodAquired = false
var VarDia_ThanksMister = false

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if(body.is_in_group("Player")):
		if(VarDia_FoodAquired == true):
			body.DiaUI.LoadDialouge(Dia_TimyThanksYouAgain)
			body.DiaUI.startDialouge()
		if(VarDia_TimmyIsHungry == true):
			if(body.hasfood):
				body.DiaUI.LoadDialouge(Dia_TimyThanksYou)
				body.DiaUI.startDialouge()
				VarDia_TimmyIsHungry = false
				VarDia_FoodAquired = true
			else:
				body.DiaUI.LoadDialouge(Dia_TimyIsFat)
				body.DiaUI.startDialouge()
				print("2")
		if(VarDia_TmmyFirstTime == true):
			body.DiaUI.LoadDialouge(Dia_TimyIntroduction)
			body.DiaUI.startDialouge()
			VarDia_TmmyFirstTime = false
			VarDia_TimmyIsHungry = true
			print("1")