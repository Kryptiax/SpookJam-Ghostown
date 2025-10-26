extends Node3D
const north_passage = "res://Town_Parts/north_section.tscn"
const gem_room = "res://Town_Parts/north_section.tscn"
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
@onready var south_spawn: Node3D = $"SouthSpawn"
@onready var north_spawn: Node3D = $"NorthSpawn"

var target = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WorldInfo.topDown = true
	match WorldInfo.direction:
			WorldInfo.DIRECTIONS.NORTH:
				spawn.position = south_spawn.global_position
				add_child(spawn)
			WorldInfo.DIRECTIONS.SOUTH:
				print("south")
				spawn.position = north_spawn.global_position
				add_child(spawn)
				
func _process(_delta: float) -> void:
	target = spawn.global_transform.origin
	get_tree().call_group("ghosts", "update_target_location", target)


func _on_north_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.NORTH
		get_tree().change_scene_to_file(gem_room)



func _on_south_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.SOUTH
		get_tree().change_scene_to_file(north_passage)
