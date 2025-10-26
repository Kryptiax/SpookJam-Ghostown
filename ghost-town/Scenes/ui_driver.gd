extends Control

@onready var heart_1: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART1
@onready var heart_2: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART2
@onready var heart_3: AnimatedSprite2D = $CanvasLayer/GridContainer/HEART3

@onready var tf_is_this_color: Sprite2D = $"CanvasLayer/GridContainer/GemHolder/TF is this color"
@onready var green: Sprite2D = $CanvasLayer/GridContainer/GemHolder/GreenGem
@onready var red: Sprite2D = $CanvasLayer/GridContainer/GemHolder/RedGem
@onready var gem_holder: AnimatedSprite2D = $CanvasLayer/GridContainer/GemHolder
@onready var death_screen: Control = $CanvasLayer/DeathScreen

var health_found
var red_gem
var green_gem
var purple_gem

@onready var pause_menu: Control = $CanvasLayer/PauseMenu
var paused

signal changePause(val)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# instantiate gem state - may be an issue LATER
	red_gem = WorldInfo.red_gem
	green_gem = WorldInfo.green_gem
	purple_gem = WorldInfo.purple_gem
	update_Gems()
	
	paused = false
	# instantiate health
	update_hearts(3)
	health_found = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(_delta: float) -> void:
	pass

func pauseMenu():
	if paused:
		pause_menu.show()
	else:
		pause_menu.hide()

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
	print_debug("poopoo")
	if red_gem:
		red.visible = true
		print_debug("poopoo")
	if green_gem:
		green.visible = true
		print_debug("poopoo")
	if purple_gem:
		tf_is_this_color.visible = true
		print_debug("purplooo")
	if green_gem == true && purple_gem == true && red_gem == true:
		tf_is_this_color.visible = false
		green.visible = false
		red.visible = false
		WorldInfo.all_gems = true
		gem_holder.frame = 1
		

func _on_player_health_changed(health: Variant) -> void:
	update_hearts(health)
	if health == 0:
		death_screen.show() 
		get_tree().paused = 1
		# game over
	pass # Replace with function body.


func _on_player_green_collected(_val: Variant) -> void:
	print("pp")
	green_gem = true
	update_Gems()
	pass # Replace with function body.


func _on_player_purple_collected(val: Variant) -> void:
	purple_gem = val
	update_Gems()
	pass # Replace with function body.


func _on_player_red_collected(val: Variant) -> void:
	red_gem = val
	update_Gems()
	pass # Replace with function body.


func _on_player_paused(val: Variant) -> void:
	paused = val
	pauseMenu()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_pressed() -> void:
	paused = !paused
	pauseMenu()
	changePause.emit(paused)


func _on_try_again_pressed() -> void:
	death_screen.hide()
	get_tree().reload_current_scene()
	get_tree().paused = 0
	pass # Replace with function body.
