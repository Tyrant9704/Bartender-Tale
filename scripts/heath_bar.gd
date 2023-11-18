extends HBoxContainer

export(PackedScene) var heath_point


# Called when the node enters the scene tree for the first time.
func _ready():
	setup_health()
	
func setup_health():
	for _i in range(save_file.game_data.lives):
		add_child(heath_point.instance())

func _on_Main_health():
	if (get_child_count() >0):
		get_child(get_child_count() -1).queue_free()
