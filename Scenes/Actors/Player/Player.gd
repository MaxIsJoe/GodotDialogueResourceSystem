extends KinematicBody2D

onready var DiaUI = $Camera2D/DiaUI

const SPEED = 350

var canmove = true

var hasfood = false

func _physics_process(delta):
	if canmove == false: #Can the player move?
		return
	var velocity = Vector2()
	if(Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("ui_down")):
		velocity.y += 1
	if(Input.is_action_pressed("ui_right")):
		velocity.x += 1
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= 1
	velocity = velocity.normalized() * SPEED
	move_and_slide(velocity)

func _on_DiaUI_AllowMovement():
	canmove = true


func _on_DiaUI_StopMovement():
	canmove = false
