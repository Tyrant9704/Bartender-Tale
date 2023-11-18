extends Control

var score = global.score
var high_score = global.high_score

func _ready():
	save_file.save_game()
	
	if score > high_score:
		high_score = score
		save_file.game_data.highscore = high_score
	
	$score_label.text = 'Your Score: ' + var2str(global.score)
	$high_score_label.text = 'High Score: ' + var2str(save_file.game_data.highscore)
	$coin_container/coin_label.text = var2str(save_file.game_data.coins) 


func _on_respawn_button_pressed():
	LoadingScreen.load_scene(self, "res://scripts/Main.tscn")
	global.reset()

func _on_shop_button_pressed():
	get_tree().change_scene('res://scripts/shop.tscn')



func _on_TouchScreenButton_pressed():
	save_file.save_game()
	get_tree().quit()


func _on_main_menu_pressed():
	get_tree().change_scene('res://scripts/main_menu.tscn')
