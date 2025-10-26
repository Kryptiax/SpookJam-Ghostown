extends Node3D
const to_maze = preload("uid://ch6fs5vo75366")
const town_center = preload("uid://cfre02u3h2541")
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
@onready var east: Node3D = $EastSpawn
@onready var west: Node3D = $WestSpawn
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
				spawn.position = north_spawn.global_position
				add_child(spawn)
				
func _process(_delta: float) -> void:
	target = spawn.global_transform.origin
	get_tree().call_group("ghosts", "update_target_location", target)


func _on_north_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.NORTH
		get_tree().change_scene_to_packed(to_maze)



func _on_south_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.SOUTH
		get_tree().change_scene_to_packed(town_center)
