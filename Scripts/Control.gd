extends Control

var Dialoug
var HoldingDialoug = []
var HoldingNames = []
var page = 0

onready var DiaUI = self
onready var DiaTextUI = $DiaHolder/DiaText
onready var DiaNamesUI = $DiaHolder/NamesUI/NamesLabel
onready var DiaNamesUIHolder = $DiaHolder/NamesUI

signal StopMovement
signal AllowMovement

	
func _process(delta):
	updateDialouge()


func startDialouge():
	DiaUI.visible = true
	HoldingDialoug = Dialoug.Strings
	HoldingNames = Dialoug.Names
	page = 0
	DiaTextUI.bbcode_text = HoldingDialoug[0]
	DiaNamesUI.text = HoldingNames[0]
	emit_signal("StopMovement")

func updateDialouge():
	if(DiaUI.visible == true):
		if(Input.is_action_just_pressed("ui_accept")):
			DiaNamesUIHolder.visible = true
			if(page == HoldingDialoug.size()-1):
				DiaUI.visible = false
				emit_signal("AllowMovement")
			if(page < HoldingDialoug.size()-1):
				page += 1
				DiaTextUI.bbcode_text = HoldingDialoug[page]
				DiaNamesUI.text = HoldingNames[page]
				if(HoldingNames[page] == "."):
					DiaNamesUIHolder.visible = false
				
func LoadDialouge(DiaTres):
	Dialoug = load(DiaTres)