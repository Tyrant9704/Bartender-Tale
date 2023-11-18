extends KinematicBody

var movement = 30


onready var anim = get_node("bartener/AnimationPlayer")

func _ready():
	pass

func _process(delta):
	
	 _raycastdetect(delta)
	
	
func _raycastdetect(delta):
	
	var yeet_collider = false
	var double_points_collider = false
	var close_call_collider = false
	
	var yeet = $yeet.get_collider()
	var double_points = $double_points.get_collider()
	var close_call = $close_call.get_collider()
		
	if Input.is_action_just_pressed("ui_left"):
		anim.stop()
		anim.play('GiveDrink')
		if yeet is Node:
			if yeet.is_in_group('client_1'):
				yeet_collider = true
		if double_points is Node:
			if double_points.is_in_group('client_1'):
				double_points_collider = true
		if close_call is Node:
			if close_call.is_in_group('client_1'):
				close_call_collider = true
					
	if Input.is_action_just_pressed("ui_right"):
		anim.stop()
		anim.play('GiveDrink')
		if yeet is Node:
			if yeet.is_in_group('client_2'):
				yeet_collider = true
		if double_points is Node:
			if double_points.is_in_group('client_2'):
				double_points_collider = true
		if close_call is Node:
			if close_call.is_in_group('client_2'):
				close_call_collider = true
	
	if Input.is_action_just_pressed("ui_up"):
		anim.stop()
		anim.play('GiveDrink')
		if yeet is Node:
			if yeet.is_in_group('client_3'):
				yeet_collider = true
		if double_points is Node:
			if double_points.is_in_group('client_3'):
				double_points_collider = true
		if close_call is Node:
			if close_call.is_in_group('client_3'):
				close_call_collider = true
					
	if Input.is_action_just_pressed("ui_down"):
		anim.stop()
		anim.play('GiveDrink')
		if yeet is Node:
			if yeet.is_in_group('client_4'):
				yeet_collider = true
		if double_points is Node:
			if double_points.is_in_group('client_4'):
				double_points_collider = true
		if close_call is Node:
			if close_call.is_in_group('client_4'):
				close_call_collider = true
					


######## movement########
	if Input.is_action_just_pressed("left"):
		anim.stop()
		anim.play_backwards('WalkRight')
		transform.origin.x -= movement
		if transform.origin.x <= -31:
			transform.origin.x = -30
		
		
	if Input.is_action_just_pressed("right"):
		anim.stop()
		anim.play('WalkRight')
		transform.origin.x += movement
		if transform.origin.x >= 31:
			transform.origin.x = 30
			
########## power-ups ##########

	if save_file.game_data.slow_motion_amount > 0:
		if Input.is_action_just_pressed('slow_motion'):
			Engine.time_scale = 0.5
			save_file.game_data.slow_motion_amount -= 1
			yield(get_tree().create_timer(3),'timeout')
			Engine.time_scale = 1
		
			
	if Input.is_action_just_pressed("ui_accept"):
		if yeet is Node:
			if yeet.is_in_group('joker'):
				yeet_collider = true
		if double_points is Node:
			if double_points.is_in_group('joker'):
				double_points_collider = true
		if close_call is Node:
			if close_call.is_in_group('joker'):
				close_call_collider = true
						
####### points calculator ##########
						
	if yeet_collider == true && double_points_collider == true && close_call_collider == true:
		global.emit_signal('triple')
		close_call.queue_free()
		
	elif yeet_collider == true && double_points_collider == true && close_call_collider == false:
		global.emit_signal('double')
		double_points.queue_free()
		
	elif yeet_collider == true && double_points_collider == false && close_call_collider == false:
		global.emit_signal('single')
		yeet.queue_free()
