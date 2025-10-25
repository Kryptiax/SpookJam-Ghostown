extends Node3D
const new_side = preload("uid://bd2yc86l7itq1")
@onready var player: CharacterBody3D = $CharacterBody3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(player.global_transform.origin)
	get_tree().call_group("ghosts", "update_target_location", player.global_transform.origin)




func _on_left_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = true
		get_tree().change_scene_to_packed(new_side)


func _on_right_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = false
		get_tree().change_scene_to_packed(new_side)
