extends MeshInstance3D

var blue = preload("res://Scenes/PadsBlue'.tres")
var green = preload("res://Scenes/PadsGreen.tres")
var yellow = preload("res://Scenes/PadsYellow.tres")
var red = preload("res://Scenes/PadsRed.tres")
var white = preload("res://Scenes/BlankMaterial.tres")
var first: Array = [blue]
var second: Array = [blue, green]
var third: Array = [blue, green, red, blue]
var fourth: Array = [blue, green, red, blue, yellow]
var fifth: Array = [blue, green, red, blue, yellow, green]
var gameplay: Array = [first, second, third, fourth, fifth]
var player_response: Array = []
var i: int = 0
var game = gameplay[i]

const GREEN_GEM = preload("res://Scenes/GreenGem.tscn")

func _ready() -> void:
	play_game(gameplay[i])


func _process(delta: float) -> void:
	check_response(gameplay[i])

func play_game(game):
	set_surface_override_material(0, white)
	await get_tree().create_timer(1).timeout
	for color in game:
		set_surface_override_material(0, color)
		await get_tree().create_timer(1).timeout
	await get_tree().create_timer(0.5).timeout
	set_surface_override_material(0, white)
	

func check_response(game):
	if player_response.size() == game.size():
		await get_tree().create_timer(0.5).timeout
		if player_response == game:
			print("sequence correct!")
			player_response.clear()
			i+= 1
			if i == 5:
				give_gem()
			play_game(gameplay[i])	
		else:
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

func _on_respond_pads_green() -> void:
	set_surface_override_material(0, green)
	player_response.append(green)

func _on_respond_pads_red() -> void:
	set_surface_override_material(0, red)
	player_response.append(red)

func _on_respond_pads_yellow() -> void:
	set_surface_override_material(0, yellow)
	player_response.append(yellow)
	
func give_gem():
	var gem_instance = GREEN_GEM.instantiate()
	gem_instance.position = Vector3(0, 0.5, 0)
	pass
