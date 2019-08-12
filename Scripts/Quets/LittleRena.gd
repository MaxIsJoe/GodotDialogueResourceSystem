extends Sprite

var Dia_RenaIsNotHungry = "res://DialougFiles/RenaDoesntWantToEat.tres"
var VarDia_GotTheHamburger = false



func _on_Area2D_body_entered(body):
	if(body.is_in_group("Player")):
		if(VarDia_GotTheHamburger == false):
			body.DiaUI.LoadDialouge(Dia_RenaIsNotHungry)
			body.DiaUI.startDialouge()
			body.hasfood = true
			VarDia_GotTheHamburger = true