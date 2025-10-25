extends CharacterBody3D


const SPEED = 15.0
const JUMP_VELOCITY = 4.5

# Health Calc
var currentHealth
var maxHealth = 3
signal health_changed(health)

@onready var anim = $AnimatedSprite3D
@onready var flashlight: Node3D = $Flashlight
var flashlight_on = false

func _ready() -> void:
	currentHealth = maxHealth

func _input(_event: InputEvent) -> void:
	pass # if event.is_action_pressed(ui_left)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var flashlight_toggle := Input.i("flashlight_toggle")
	
	if Input.is_action_just_pressed("flashlight_toggle"):
		flashlight_on = !flashlight_on
	
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		var temp = direction
		direction.x = temp.z
		direction.y = temp.y
		direction.z = -temp.x
		#print(direction)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	flashlight.visible = flashlight_on
	
		
	
	if (flashlight_on == true):
		
		if (global_position + direction != global_position):
			flashlight.look_at(global_position + direction, Vector3.UP)

	move_and_slide()
	
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()

	if input_vector != Vector2.ZERO:
		_update_animation(input_vector)

func take_damage(amount):
	currentHealth -= amount
	emit_signal("health_changed", currentHealth) # default loss is 1 health (1 heart)
	print("Player took damage! Current health:", currentHealth)

	if currentHealth <= 0:
		die()

func die():
	print("Player is dead! gg go eat your own ass lil player guy fella guy mf bingle pisscon the wiper mr bean eat my shiny metal jolly lit")
   	# Optional: disable movement, restart scene, play animation, etc.
	#get_tree().reload_current_scene()

func _update_animation(dir: Vector2) -> void:
	var angle = dir.angle()  # Radians, 0 = east, counterclockwise

	if angle >= -PI/8 and angle < PI/8:
		anim.play("east")
	elif angle >= PI/8 and angle < 3*PI/8:
		anim.play("southeast")
	elif angle >= 3*PI/8 and angle < 5*PI/8:
		anim.play("south")
	elif angle >= 5*PI/8 and angle < 7*PI/8:
		anim.play("southwest")
	elif angle >= 7*PI/8 or angle < -7*PI/8:
		anim.play("west")
	elif angle >= -7*PI/8 and angle < -5*PI/8:
		anim.play("northwest")
	elif angle >= -5*PI/8 and angle < -3*PI/8:
		anim.play("north")
	elif angle >= -3*PI/8 and angle < -PI/8:
		anim.play("northeast")
