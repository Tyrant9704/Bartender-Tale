extends Node

var save_path = 'res://bartenders.dat'

var game_data = {}

func _ready():
	load_game()

func _process(delta):
	print(game_data)
		
func load_game():
	var file = File.new()
	if not file.file_exists(save_path):
		game_data = {
			'coins' : 0,
			'highscore' :0,
			'tempo' : 0,
			'joker' : 0,
			'slow_motion' : 0
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
