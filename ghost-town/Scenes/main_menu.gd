extends Control

@onready var options: TextureRect = $Options
#@onready var credits_bg: TextureRect = $"Options/VBoxContainer/Credits/Credits BG"
@onready var optionsBox: VBoxContainer = $Options/VBoxContainer
var muted
var credits
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	muted = false
	credits = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().load("res://Scripts/city_center.gd")
	pass # Replace with function body.


func _on_options_pressed() -> void:
	options.show()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_back_pressed() -> void:
	options.hide()
	pass # Replace with function body.

func _on_mute_pressed() -> void:
	if muted == false:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	print("Muted:", muted)
	muted = !muted

	print("Nuke Inbound for France. Thank you for your patronage.")
	pass # Replace with function body.


#func _on_credits_pressed() -> void:
#	credits = !credits
#	if credits == true:
#		credits_bg.show()
#	else:
#		optionsBox.show()
#		credits_bg.hide()
#	pass # Replace with function body.
