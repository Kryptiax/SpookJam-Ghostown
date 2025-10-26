extends Node3D

signal red
signal yellow
signal blue
signal green
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_red_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		red.emit()

func _on_blue_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		blue.emit()

func _on_yellow_2_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		yellow.emit()

func _on_greenb_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		green.emit()
