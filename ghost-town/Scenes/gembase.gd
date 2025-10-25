extends Node3D

signal greenGemGrabbed(val)
signal redGemGrabbed(val)
signal purpleGemGrabbed(val)

func _ready():
	add_to_group("interactable")

func interact(_player):
	print("Player interacted with:", self.name)
	if self.name == "GreenGem":
		print("recieved greengem!")
		greenGemGrabbed.emit(true)
	if self.name == "RedGem":
		print("recieved greengem!")
		redGemGrabbed.emit(true)
	if self.name == "PurpleGem":
		print("recieved purplegem!")
		purpleGemGrabbed.emit(true)
	
	queue_free()
	# Example: pick up, open door, show UI, etc.
