extends Node3D

const character = preload("uid://dnbw6fwhru3yt")
const MAIN = preload("uid://0lf8n6v1j6bu")
@onready var right_spawn: Node3D = $RightSpawn
@onready var left_spawn: Node3D = $LeftSpawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn = character.instantiate()
	if WorldInfo.direction:
		spawn.position = right_spawn.global_position
		add_child(spawn)
	else:
		spawn.position = left_spawn.global_position
		add_child(spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_right_area_body_entered(body: Node3D) -> void:
	pass # Replace with function body.



func _on_left_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = true
		get_tree().change_scene_to_packed(MAIN)
