extends CharacterBody3D
var tween
var hit_tween
var knockback: Vector3 =Vector3.ZERO
var timer: float = 0.0
@onready var health = 75
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
var SPEED = 5

func update_target_location(target_location):
	print(target_location)
	nav_agent.set_target_position(target_location)
	
func _ready() -> void:
	pass
	

func _physics_process(delta: float) -> void:
	#display_number(39)
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	velocity = current_location.direction_to(next_location) * SPEED
	
		
	move_and_slide()
