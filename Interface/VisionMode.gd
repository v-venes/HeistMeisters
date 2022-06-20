extends CanvasModulate

const DARK = Color("151515")
const NIGHTVISION = Color("37bf62")

onready var NIGHVISION_OFF_SFX = load("res://SFX/nightvision_off.wav")
onready var NIGHVISION_ON_SFX = load("res://SFX/nightvision.wav")

var onCooldown = false

func _ready():
	visible = true
	color = DARK
	
func cycle_vision_mode():
	if onCooldown:
		return
		
	if color == NIGHTVISION:
		dark_mode()
	else: 
		night_vision_mode()
	
	onCooldown = true
	$NightvisionCooldown.start()

func dark_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = NIGHVISION_OFF_SFX
	$AudioStreamPlayer2D.play()

func night_vision_mode():
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = NIGHVISION_ON_SFX
	$AudioStreamPlayer2D.play()


func _on_NightvisionCooldown_timeout():
	onCooldown = false
