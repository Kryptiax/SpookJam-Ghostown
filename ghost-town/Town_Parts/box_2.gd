extends MeshInstance3D
var blue = preload("res://Scenes/PadsBlue'.tres")
var green = preload("res://Scenes/PadsGreen.tres")
var yellow = preload("res://Scenes/PadsYellow.tres")
var red = preload("res://Scenes/PadsRed.tres")
var white = preload("res://Scenes/BlankMaterial.tres")
var correct: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_two_blue() -> void:
	set_surface_override_material(0, blue)
	correct = true


func _on_two_red() -> void:
	set_surface_override_material(0, red)
	correct = false
	


func _on_two_green() -> void:
	set_surface_override_material(0, green)
	correct = false


func _on_two_yellow() -> void:
	set_surface_override_material(0, yellow)
	correct = false
