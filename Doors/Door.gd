extends Area2D

var can_open = false


func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	can_open = true
	open_door()

func _on_Area2D_body_exited(body):
	can_open = false

func open_door():
	$AnimationPlayer.play("Open")
