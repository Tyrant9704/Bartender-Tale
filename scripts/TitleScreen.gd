extends MarginContainer

func _ready():
	save_file.load_game()
	
	if save_file.game_data.lives <= save_file.game_data.max_health:
		save_file.game_data.lives = save_file.game_data.max_health
		
	

func _on_play_buttom_pressed():
	LoadingScreen.load_scene(self, "res://scripts/Main.tscn")
	



func _on_exit_button_pressed():
	get_tree().quit()
