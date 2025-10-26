extends Area3D

@onready var anims: AnimationPlayer = $AnimationPlayer

func _ready():
	if self.name == "PurpleGem" or self.name == "GreenGem":
		anims.play("turn")
	add_to_group("interactable")
	if self.is_in_group("interactable"):
		print("This node is an interactable item!")

func interact():
	print("Player interacted with:", self.name)
	if self.name == "GreenGem":
		print("recieved greengem!")
	if self.name == "RedGem":
		print("recieved greengem!")
	if self.name == "PurpleGem":
		print("recieved purplegem!")
	
	queue_free()
	# Example: pick up, open door, show UI, etc.
