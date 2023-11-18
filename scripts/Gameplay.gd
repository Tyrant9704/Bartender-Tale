extends MarginContainer


export var buy_a_life = 80
var finished

signal health
signal give_up

func _ready():
	pass
	

func _process(_delta):
	$hud_menu/upper_hud/points/point_label.text = var2str(global.score)
	
	slow_motion_button()


func _on_resume_button_pressed():
	get_tree().paused = false
	$hud_menu.visible = true
	$pasue_menu.visible = false
	


func _on_Main_ready():
	get_tree().paused = true
	$hud_menu.visible = false
	$pasue_menu.visible = false
	$countdown/AnimationPlayer.play("countdown")
	

func _on_AnimationPlayer_animation_finished(_countdown):
	get_tree().paused = false
	$countdown.visible = false
	$hud_menu.visible = true
	finished = 0


func _on_pause_button_pressed():
	get_tree().paused = true
	$hud_menu.visible = false
	$pasue_menu.visible = true
	


#func _on_buy_a_life_pressed():
	#if save_file.game_data.coins >= 80:
		#save_file.game_data.lives += 1
		#buy_a_life += 20
		#save_file.game_data.coins -= 20
		#$game_over_popup.visible = false
		#global.speed -= 0.5
		#global.time_to_spawn += 0.3
		#$countdown.visible = true
		#$countdown/AnimationPlayer.play("countdown")
		#get_node("heath_bar").setup_health()


func _on_give_up_button_pressed():
	emit_signal('give_up')
	get_tree().paused = false

func _on_joker_pressed():
	save_file.game_data.joker -= 1
	
	$buttons.visible = false
	$joker_button.visible = true
	$controls/joker.visible = false
	
	yield(get_tree().create_timer(5), 'timeout')

	$buttons.visible = true
	$joker_button.visible = false
	$controls/joker.visible = true

func _on_tempo_restart_pressed():
	save_file.game_data.tempo -= 1
	if global.speed >= 15:
		global.speed -= 4
	else:
		global.speed -= 2
	if global.time_to_spawn <= 0.5:
		global.time_to_spawn += 0.75
	else:
		global.time_to_spawn += 0.5


func _on_main_menu_pressed():
	get_tree().paused = false
	save_file.save_game()
	get_tree().change_scene('res://scripts/TitleScreen.tscn')


func _on_rage_quit_pressed():
	get_tree().quit()

func slow_motion_button():
	var slow_motion_button = $hud_menu/VBoxContainer/slow_motion/
	var slow_mo_amount = save_file.game_data.slow_motion_amount
	
	if slow_mo_amount <= 0:
		slow_motion_button.visible = true
	else:
		slow_motion_button.visible = false
	
func _on_slow_motion_button_pressed():
	var slow_mo_lvl = save_file.game_data.slow_motion_level
	var slow_mo_amount = save_file.game_data.slow_motion_amount
	var slow_mo_duration = 5
	
	Engine.time_scale = 0.5 
	yield(get_tree().create_timer(slow_mo_duration + slow_mo_lvl/2),"timeout")
	Engine.time_scale = 1
	slow_mo_amount -= 1
