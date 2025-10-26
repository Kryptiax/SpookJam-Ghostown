extends Node3D
const new_side = preload("uid://bd2yc86l7itq1")
const playa = preload("res://Scenes/player.tscn")
var spawn = playa.instantiate()
var gem_collected: bool = false 
@onready var east: Node3D = $EastSpawn
@onready var west: Node3D = $WestSpawn
@onready var station: Node3D = $Station

@onready var box_one: MeshInstance3D = $City/BoxOne
@onready var box_two: MeshInstance3D = $City/BoxTwo
@onready var box_three: MeshInstance3D = $City/BoxThree
@onready var box_four: MeshInstance3D = $City/BoxFour
@onready var purple_gem: Area3D = $PurpleGem



var target = Vector3(0,0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WorldInfo.topDown = false
	if !WorldInfo.init:
		spawn.position = station.global_position
		add_child(spawn)
		WorldInfo.init = true
	else:
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
	target = spawn.global_transform.origin
	get_tree().call_group("ghosts", "update_target_location", target)
	
	check_success()




func _on_left_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.WEST
		get_tree().change_scene_to_packed(new_side)


func _on_right_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		WorldInfo.direction = WorldInfo.DIRECTIONS.EAST
		get_tree().change_scene_to_packed(new_side)

func give_gem():
		purple_gem.visible = true
	
	
func check_success():
	if box_one.correct and box_two.correct and box_three.correct and box_four.correct:
		if !gem_collected:
			give_gem()
