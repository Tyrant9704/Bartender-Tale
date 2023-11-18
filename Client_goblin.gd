extends KinematicBody

var velocity = Vector3.ZERO
var speed = global.speed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector3.UP)
	get_node("goblin/AnimationPlayer").play("Walk")
	velocity =+ transform.basis.z * speed
