extends Node3D
const new_side = preload("uid://bd2yc86l7itq1")
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
@onready var west: Node3D = $Spawn

@onready var box_one: MeshInstance3D = $City/BoxOne
@onready var box_two: MeshInstance3D = $City/BoxTwo
@onready var box_three: MeshInstance3D = $City/BoxThree
@onready var box_four: MeshInstance3D = $City/BoxFour



var target = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WorldInfo.topDown = true
	spawn.position = west.global_position
	add_child(spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	target = spawn.global_transform.origin
	get_tree().call_group("ghosts", "update_target_location", target)






func _on_area_3d_body_entered(body: Node3D) -> void:
	print("play_new_side")
	if body.is_in_group("player"):
			WorldInfo.direction = WorldInfo.DIRECTIONS.EAST
			get_tree().change_scene_to_packed(new_side)
