extends RayCast3D

@onready var flashlight: Node3D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if flashlight.visible:
		if is_colliding(): 
			print(get_collision_point())
			print("boilolo")
			var body = get_collider()
			if body.is_in_group("ghosts") && body != null:
				print("youi")
				body.die()
