extends Node3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
@onready var mesh_instance_3d_2: MeshInstance3D = $MeshInstance3D2
@onready var mesh_instance_3d_3: MeshInstance3D = $MeshInstance3D3
@onready var mesh_instance_3d_5: MeshInstance3D = $MeshInstance3D5
signal  open_door
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_color(color):
	print("wow")
	mesh_instance_3d.set_surface_override_material(0, color)
	mesh_instance_3d_2.set_surface_override_material(0, color)
	mesh_instance_3d_3.set_surface_override_material(0, color)
	mesh_instance_3d_5.set_surface_override_material(0, color)



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		open_door.emit()
		queue_free()
