extends Control

@onready var heart_1: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART1
@onready var heart_2: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART2
@onready var heart_3: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART3

var health_found

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_hearts(3)
	health_found = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func update_hearts(health):
	match health:
		3:
			heart_1.frame = 0
			heart_2.frame = 0
			heart_3.frame = 0
		2:
			heart_3.play("lose")  # Rightmost heart loses
		1:
			heart_2.play("lose")
		0:
			heart_1.play("lose")


func _on_player_health_changed(health: Variant) -> void:
	update_hearts(health)
	pass # Replace with function body.
