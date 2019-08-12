# GodotDialogueResourceSystem
A Dialouge system for Godot that uses .tres files instead of JSON files for in-game dialogue.


### Why did I create this?
For the longest time i haven't been fond of the way everyone handles in-game dialogue with Godot, I didn't like the JSON approach and wanted something similar to what I used to work with in Unity, so, I have decided to create this and make it public in-case someone else like me wanted to approach dialogue in Godot withot using JSON like 99% of all tutorials that teach new comers

### How Does It Work?
The system uses .tres files to hold dialogue that can be loaded to display dialogue

.tres files are "Resources" and Resources are basiclly base classes for all resource types, serving primarily as data containers, here they hold only two Arrays, a "Strings" and "Names" arrays.

"Strings" hold all dialogue while "Names" hold all names of NPCs who are speaking at that moment

To create a dialogue Resource you just simply go to the file manager inside of godot then right click and click on "New Resource" then choose "DialogueResource", this will create a .tres file where you can edit ALL of your strings and names inside the editor without using an external program or messy syntaxes like what JSON has

### Main Functions

`LoadDialouge(DiaTres)` : Loads the dialouge that will be used, takes in a path to the file
#### Example :
```gd
###Control.gd###
func LoadDialouge(DiaTres):
	Dialoug = load(DiaTres)
###NPC.gd###
var Dia_RenaIntro = "res://DialougFiles/RenaSaysHi.tres"

func _on_Area2D_body_entered(body):
	if(body.is_in_group("Player")):
			body.DiaUI.LoadDialouge(Dia_RenaIntro)
```

----------------------------

`startDialouge()` : Starts the dialogue UI and displays the first string on screen
#### Example :
```gd
func _on_Area2D_body_entered(body):
	if(body.is_in_group("Player")):
		if(VarDia_GotTheHamburger == false):
			body.DiaUI.LoadDialouge(Dia_RenaIsNotHungry) #Loads the Dialouge that will be used
			body.DiaUI.startDialouge() #Displays the Dialouge that was loaded from the previous line
```

-----------------------------

`updateDialouge()` : Checks for player Input to display the next string in the Strings array that was loaded, It runs in `_process(delta)` so it doesn't need to be called from elsewhere.
