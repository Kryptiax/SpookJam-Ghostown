extends Node3D
const to_maze = "res://Town_Parts/maze.tscn"
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
@onready var south_spawn: Node3D = $"South Spawn"
@onready var north_spawn: Node3D = $"North Spawn"
const town_center = "res://Town_Parts/city_center.tscn"


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
				


func _on_north_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.NORTH
		get_tree().change_scene_to_file(to_maze)



func _on_south_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.SOUTH
		print("RAHHH")
		get_tree().change_scene_to_file(town_center)
