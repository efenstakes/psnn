extends Area2D



# the speed
var speed: Vector2 = Vector2(0, 200)


# Called when the node enters the scene tree for the first time.
func _ready():
	# speed.y = rand_range(100, 300)
	pass


func _physics_process(delta)-> void:
	position += speed * delta
	


func _on_Balloon_body_entered(body):
	if body.name == "Player":
		EventManager.gain_made_event(5)
		queue_free()