extends Node3D
const north_passage = "res://Town_Parts/north_section.tscn"
const gem_room = "res://Town_Parts/north_section.tscn"
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()

var blue = preload("res://Scenes/PadsBlue'.tres")
var green = preload("res://Scenes/PadsGreen.tres")
var yellow = preload("res://Scenes/PadsYellow.tres")
var red = preload("res://Scenes/PadsRed.tres")
var white = preload("res://Scenes/BlankMaterial.tres")

@onready var south_spawn: Node3D = $"SouthSpawn"
@onready var north_spawn: Node3D = $"NorthSpawn"

@onready var blue_key: Node3D = $walls/BlueKey
@onready var red_key: Node3D = $walls/RedKey
@onready var green_key: Node3D = $walls/GreenKey
@onready var yellow_key: Node3D = $walls/YellowKey


@onready var green_door: CSGBox3D = $walls/GreenDoor
@onready var blue_door: CSGBox3D = $walls/BlueDoor
@onready var red_door: CSGBox3D = $walls/RedDoor
@onready var yellow_door: CSGBox3D = $walls/YellowDoor


func set_keys():
	blue_key.set_color(blue)
	red_key.set_color(red)
	green_key.set_color(green)
	yellow_key.set_color(yellow)
	
var target = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_keys()
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
		



func _on_green_key_open_door() -> void:
	green_door.queue_free()


func _on_blue_key_open_door() -> void:
	blue_door.queue_free()


func _on_red_key_open_door() -> void:
	red_door.queue_free()


func _on_yellow_key_open_door() -> void:
	yellow_door.queue_free()
