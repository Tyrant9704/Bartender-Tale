extends Node

var save_path = 'user://bartender_alpha4.dat'

var game_data = {}

func _ready():
	load_game()
	
func _process(delta):
 pass
		
func load_game():
	var file = File.new()
	if not file.file_exists(save_path):
		game_data = {
			'coins' : 0,
			'highscore' :0,
			
			
			'max_health' : 3,
			'lives' : 3,
			
			
			'tutorial' : 0,
			
			
			'tempo_amount' : 0,
			'tempo_level' : 0,
			'tempo_price' : 350,
			
			'slow_motion_amount': 0,
			'slow_motion_level': 1,
			'slow_motion_price': 500,
			
			'joker_amount' : 0,
			'joker_level' : 1,
			'joker_price' : 550
			
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
