extends Node3D
@onready var blu: CSGCylinder3D = $Blu
@onready var yello: CSGCylinder3D = $Yello
@onready var greenn: CSGCylinder3D = $Gree
@onready var redi: CSGCylinder3D = $Re

var distance: float = 0.25
signal red
signal yellow
signal blue
signal green
# Called when the node enters the scene tree for the first time.

func reset_steps(step):
	step.position.y += distance


func _on_red_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		red.emit()
		redi.position.y -= distance
		

func _on_blue_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		blue.emit()
		blu.position.y -= distance

func _on_yellow_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		yellow.emit()
		yello.position.y -= distance

func _on_green_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		green.emit()
		greenn.position.y -= distance



func _on_red_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		reset_steps(redi)


func _on_blue_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		reset_steps(blu)


func _on_green_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		reset_steps(greenn)


func _on_yellow_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		reset_steps(yello)
