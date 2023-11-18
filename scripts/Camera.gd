extends Camera

var rng = RandomNumberGenerator.new()
var z = rng.randf_range(-5, 5)
var y = rng.randf_range(-5, 5)
var x = rng.randf_range(-30, -20)


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	pass


func _on_Area_body_entered(_body):
	self.rotation_degrees = Vector3(x, y, z)
	yield(get_tree().create_timer(0.1), "timeout")
	self.rotation_degrees = Vector3(-34.059, 0, 0)
	rng.randomize()
	
