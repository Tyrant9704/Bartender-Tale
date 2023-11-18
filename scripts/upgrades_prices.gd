extends Node

var save_path = 'user://bartender_uprades_alpha.dat'

var game_data = {}

func _ready():
	load_game()
	
func _process(delta):
 pass
		
func load_game():
	var file = File.new()
	if not file.file_exists(save_path):
		game_data = {
			
		}
		save_game()
	if file.file_exists(save_path):
		file.open(save_path, File.READ)
		game_data = file.get_var()
		file.close()

func save_game():
	var file = File.new()
	file.open(save_path, File.WRITE)
	file.store_var(game_data)
	file.close()
