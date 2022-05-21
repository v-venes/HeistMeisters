extends "res://Characters/TemplateCharacter.gd"

const FOV_TOLERANCE = 20
const RED = Color(1, 0.25, 0.25)
const WHITE = Color(1,1,1)
const MAX_DETECTION_RANGE = 640

var Player

func _ready():
	Player = get_node("/root").find_node("Player", true, false)

func _process(delta):
	if player_in_fov() && player_in_los():
		$Torch.color = RED
		return
		
	$Torch.color = WHITE

func player_in_fov():
	var npc_facing_dir = Vector2(1, 0).rotated(global_rotation)
	var dir_to_player = (Player.position - global_position).normalized()
	
	if abs(dir_to_player.angle_to(npc_facing_dir)) < deg2rad(FOV_TOLERANCE):
		return true
	
	return false

func player_in_los():
	var space = get_world_2d().direct_space_state
	var los_obstacle = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	
	if !los_obstacle:
		return false
	
	var distance_to_player = Player.global_position.distance_to(global_position)
	var player_in_range = distance_to_player < MAX_DETECTION_RANGE
	
	if los_obstacle.collider == Player && player_in_range: 
		return true
	
	return false
