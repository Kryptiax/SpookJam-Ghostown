extends MeshInstance3D
@onready var green_gem: Area3D = $"../GreenGem"

var blue = preload("res://Scenes/PadsBlue'.tres")
var green = preload("res://Scenes/PadsGreen.tres")
var yellow = preload("res://Scenes/PadsYellow.tres")
var red = preload("res://Scenes/PadsRed.tres")
var white = preload("res://Scenes/BlankMaterial.tres")
var first: Array = [blue]
var win = false
var second: Array = [blue, green]
var third: Array = [blue, green, red, yellow]
var gameplay: Array = [first, second, third]
var player_response: Array = []
var i: int = 0
var game = gameplay[i]
var debug = []
const GREEN_GEM = preload("res://Scenes/GreenGem.tscn")

func _ready() -> void:
	i = 0
	play_game(gameplay[i])


func _process(_delta: float) -> void:
	if i<3:
		check_response(gameplay[i])

func play_game(game):
	win = false
	set_surface_override_material(0, white)
	await get_tree().create_timer(1).timeout
	for color in game:
		set_surface_override_material(0, color)
		await get_tree().create_timer(1).timeout
	
func next_game():
	play_game(gameplay[i])
	
func check_response(game):
	print(debug)
	if player_response.size() == game.size():
		if player_response == game:
			win = true
			print(debug)
			print("sequence correct!")
			player_response.clear()
			debug.clear()
				
			if win == true:
				i += 1
				print("rrrr")
				if i < 3:
					play_game(gameplay[i])
				else:
					give_gem()

		
		else:
			print(debug)
			print("wrong!!")
			player_response.clear()
			set_surface_override_material(0, red)
			await get_tree().create_timer(0.25).timeout
			set_surface_override_material(0, white)
			await get_tree().create_timer(0.25).timeout
			set_surface_override_material(0, red)
			await get_tree().create_timer(0.25).timeout
			set_surface_override_material(0, white)
			play_game(gameplay[i])
			


func _on_respond_pads_blue() -> void:
	set_surface_override_material(0, blue)
	player_response.append(blue)
	debug.append("blue")

func _on_respond_pads_green() -> void:
	set_surface_override_material(0, green)
	player_response.append(green)
	debug.append("gren")

func _on_respond_pads_red() -> void:
	set_surface_override_material(0, red)
	player_response.append(red)
	debug.append("re")

func _on_respond_pads_yellow() -> void:
	set_surface_override_material(0, yellow)
	player_response.append(yellow)
	debug.append("yel")
	
func give_gem():
	green_gem.visible = true
	#var gem_instance = GREEN_GEM.instantiate()
	#gem_instance.position = Vector3(0, 0.5, 0)
	#pass
