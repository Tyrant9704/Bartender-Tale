extends Control

export var slow_motion_price = 150
export var max_health_price = 850
export var tempo_restart_price = 300
export var joker_price = 320
export var extra_life_price = 200

var gold = save_file.game_data.coins

func _ready():
	pass
	
func _process(delta):
	$Background/Punkty/coins_label.text = var2str(save_file.game_data.coins)
	$shop_buttons/slow_motion/slow_motion_price.text = var2str(slow_motion_price)
	$shop_buttons/max_health/max_health_price.text = var2str(max_health_price)
	$shop_buttons/tempo_restart/tempo_restart_price.text = var2str(tempo_restart_price)
	$shop_buttons/joker/joker_price.text = var2str(joker_price)
	$shop_buttons/extra_fife/extra_life_price.text = var2str(extra_life_price)


func _on_slow_motion_pressed():
	if save_file.game_data.coins >= slow_motion_price:
		save_file.game_data.slow_motion += 1
		save_file.game_data.coins -= slow_motion_price
		slow_motion_price += 10
		save_file.save_game()


func _on_max_health_pressed():
	if save_file.game_data.coins >= max_health_price:
		save_file.game_data.max_health += 1
		save_file.game_data.lives += 1
		save_file.game_data.coins -= max_health_price
		max_health_price += 150
		save_file.save_game()

func _on_tempo_restart_pressed():
	if save_file.game_data.coins >= tempo_restart_price:
		save_file.game_data.tempo += 1
		save_file.game_data.coins -= tempo_restart_price
		tempo_restart_price += 80
		save_file.save_game()

func _on_joker_pressed():
	if save_file.game_data.coins >= joker_price:
		save_file.game_data.joker += 1
		save_file.game_data.coins -= joker_price
		joker_price += 180
		save_file.save_game()

func _on_extra_life_pressed():
	if save_file.game_data.coins >= extra_life_price:
		save_file.game_data.lives += 1
		save_file.game_data.coins -= extra_life_price
		extra_life_price += 150
		save_file.save_game()


func _on_return_button_pressed():
	get_tree().change_scene("res://scripts/game_over.tscn")
