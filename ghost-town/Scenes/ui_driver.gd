extends Control

@onready var heart_1: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART1
@onready var heart_2: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART2
@onready var heart_3: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART3

@onready var tf_is_this_color: Sprite2D = $"CanvasLayer/GridContainer/GemHolder/TF is this color"
@onready var green: Sprite2D = $CanvasLayer/GridContainer/GemHolder/GreenGem
@onready var red: Sprite2D = $CanvasLayer/GridContainer/GemHolder/RedGem
@onready var gem_holder: AnimatedSprite2D = $CanvasLayer/GridContainer/GemHolder

var health_found
var red_gem
var green_gem
var purple_gem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# instantiate gem state - may be an issue LATER
	red_gem = false
	green_gem = false
	purple_gem = false
	update_Gems()
	
	# instantiate health
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

func update_Gems():
	if red_gem:
		red.visible = true
		print_debug("poopoo")
	if green_gem:
		green.visible = true
		print_debug("poopoo")
	if purple_gem:
		tf_is_this_color.visible = true
		print_debug("purplooo")
		
	if green_gem && purple_gem && red_gem:
		tf_is_this_color.visible = false
		green.visible = false
		red.visible = false
		gem_holder.frame = 1
		

func _on_player_health_changed(health: Variant) -> void:
	update_hearts(health)
	pass # Replace with function body.


func _on_player_green_collected(val: Variant) -> void:
	green_gem = true
	update_Gems()
	pass # Replace with function body.


func _on_player_purple_collected(val: Variant) -> void:
	purple_gem = true
	update_Gems()
	pass # Replace with function body.


func _on_player_red_collected(val: Variant) -> void:
	red_gem = true
	update_Gems()
	pass # Replace with function body.
