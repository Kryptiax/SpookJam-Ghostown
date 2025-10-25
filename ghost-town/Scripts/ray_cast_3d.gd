extends RayCast3D

<<<<<<< Updated upstream
@onready var flashlight: Node3D = $".."

=======
>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
<<<<<<< Updated upstream
func _process(_delta: float) -> void:
	
	if flashlight.visible:
		if is_colliding(): 
			print(get_collision_point())
			print("boilolo")
			var body = get_collider()
			if body.is_in_group("ghosts"):
				print("youi")
				body.die()
		
	
=======
func _process(delta: float) -> void:
	if is_colliding(): 
		print(get_collision_point())
		print("boilolo")
		var body = get_collider()
		if body.is_in_group("ghosts"):
			print("youi")
			body.die()
>>>>>>> Stashed changes
