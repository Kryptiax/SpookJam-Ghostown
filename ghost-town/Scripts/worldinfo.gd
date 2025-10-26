extends Node

enum DIRECTIONS  {
	NORTH,
	SOUTH,
	EAST,
	WEST
}
var topDown = false
var direction: DIRECTIONS = DIRECTIONS.NORTH #left is true right is false
var init: bool = false #left is true right is false
# Called when the node enters the scene tree for the first time.
var red_gem = false
var green_gem = false
var purple_gem = false
var all_gems: bool = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
