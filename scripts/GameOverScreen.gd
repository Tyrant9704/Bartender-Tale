extends MarginContainer

func _ready():
	$HBoxContainer/VBoxContainer/txt/highscore/HBoxContainer/hi_score.text = var2str(save_file.game_data.highscore)
	$HBoxContainer/VBoxContainer/txt/yourscore/HBoxContainer/score.text = var2str(global.score)
	$HBoxContainer/VBoxContainer/txt/gold_value/gold_earned.text = var2str(global.gold)
	
func _process(delta):
	pass


func _on_raqe_quit_pressed():
	get_tree().quit()


func _on_restart_pressed():
	LoadingScreen.load_scene(self, "res://scripts/Main.tscn")


func _on_shop_pressed():
	pass


func _on_main_menu_pressed():
	get_tree().change_scene('res://scripts/TitleScreen.tscn')
