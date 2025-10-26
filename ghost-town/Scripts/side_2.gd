extends Node3D

const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
@onready var east: Node3D = $RightSpawn
@onready var west: Node3D = $LeftSpawn
var city_centre = "res://Town_Parts/city_center.tscn"
var puzzle = "res://Town_Parts/Main.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WorldInfo.topDown = false
	match WorldInfo.direction:
			WorldInfo.DIRECTIONS.NORTH:
				pass
			WorldInfo.DIRECTIONS.SOUTH:
				pass
			WorldInfo.DIRECTIONS.EAST:
				spawn.position = west.global_position
				add_child(spawn)
			WorldInfo.DIRECTIONS.WEST:
				spawn.position = east.global_position
				add_child(spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_right_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.EAST
		print("yippie")
		get_tree().change_scene_to_file(puzzle)



func _on_left_area_body_entered(body: Node3D) -> void:
	print("chanhe")
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.WEST #Side we are coming from
		print("yippie")
		get_tree().change_scene_to_file(city_centre)
