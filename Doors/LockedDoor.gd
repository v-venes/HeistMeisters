extends "res://Doors/Door.gd"

var in_door_range = false

func _on_Area2D_body_entered(body):
	in_door_range = true

func _on_Area2D_body_exited(body):
	if body.collision_layer == 1:
		in_door_range = false
		$CanvasLayer/Numpad.hide()

func _process(delta):
	if Input.is_action_just_pressed("interact") && in_door_range:
		$CanvasLayer/Numpad.popup()
