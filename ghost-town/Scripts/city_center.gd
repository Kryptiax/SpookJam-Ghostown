extends Node3D
@onready var origin: Node3D = $Spawn
@onready var people: Node3D = $People
const north_room = preload("uid://cmoh73uocqwxi")
const south_room = preload("uid://cmoh73uocqwxi")
const west_room = "res://Scenes/SetSimonSays.tscn"
const  east_room = preload("uid://bd2yc86l7itq1")
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
@onready var north: Node3D = $NorthSpawn
@onready var south: Node3D = $SouthSpawn
@onready var east: Node3D = $EastSpawn
@onready var west: Node3D = $WestSpawn
@onready var Orign: Node3D = $Spawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if WorldInfo.all_gems == true:
		people.visible = true
		
	WorldInfo.topDown = true
	if !WorldInfo.init:
		spawn.position = Orign.global_position
		add_child(spawn)
		WorldInfo.init = true
	match WorldInfo.direction:
		WorldInfo.DIRECTIONS.NORTH:
			spawn.position = south.global_position
			add_child(spawn)
		WorldInfo.DIRECTIONS.SOUTH:
			spawn.position = north.global_position
			add_child(spawn)
		WorldInfo.DIRECTIONS.EAST:
			spawn.position = west.global_position
			add_child(spawn)
		WorldInfo.DIRECTIONS.WEST:
			spawn.position = east.global_position
			add_child(spawn)

func _on_north_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.NORTH
		get_tree().change_scene_to_packed(north_room)


func _on_south_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.SOUTH
		get_tree().change_scene_to_packed(south_room)


func _on_east_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.EAST
		get_tree().change_scene_to_packed(east_room)


func _on_west_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.WEST
		get_tree().change_scene_to_file(west_room)
