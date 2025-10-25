extends Node3D
const new_side = preload("uid://bd2yc86l7itq1")
const playa = preload("res://Scenes/TempCharacter.tscn")
var spawn = playa.instantiate()
@onready var player: CharacterBody3D = $CharacterBody3D
@onready var right_spawn: Node3D = $RightSpawn
@onready var left_spawn: Node3D = $LeftSpawn
var target = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if WorldInfo.direction:
		spawn.position = right_spawn.global_position
		add_child(spawn)
	else:
		spawn.position = left_spawn.global_position
		add_child(spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	target = spawn.global_transform.origin
	get_tree().call_group("ghosts", "update_target_location", target)




func _on_left_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = true
		get_tree().change_scene_to_packed(new_side)


func _on_right_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = false
		get_tree().change_scene_to_packed(new_side)
