extends Node

var loading_scene = preload ('res://scripts/loading_screen.tscn')

func load_scene(current_scene, next_scene):
	
	#adding loader to the root
	var loading_screen_instance = loading_scene.instance()
	get_tree().get_root().call_deferred('add_child', loading_screen_instance)
	
	#find targeted scene
	var loader = ResourceLoader.load_interactive(next_scene)
	
	#check for errors
	
	if loader == null:
		print('something went wrong')
		return
		
	current_scene.queue_free()
	
	#adding delay to loading to apprear
	yield(get_tree().create_timer(0.5),"timeout")
	
	#loading chunks on loop within pool()
	
	while true:
		var error = loader.poll()
		#when chunk arrive
		if error == OK:
			var progres_bar = loading_screen_instance.get_node("HBoxContainer/VBoxContainer/TextureProgress")
			progres_bar.value = float(loader.get_stage())/loader.get_stage_count()*100
		#when everything is loaded
		elif error == ERR_FILE_EOF:
			var scene = loader.get_resource().instance()
			get_tree().get_root().call_deferred('add_child', scene)
			#removing loading scene
			loading_screen_instance.queue_free()
			return
		else:
			print('something went really wrong')
			return
		yield(get_tree().create_timer(0.5),"timeout")
		
	
