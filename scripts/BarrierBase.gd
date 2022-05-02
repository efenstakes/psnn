extends Node2D


# the speed
var speed: Vector2 = Vector2(0, 200)


# Called when the node enters the scene tree for the first time.
func _ready():
	speed.y = rand_range(100, 300)


func _physics_process(delta)-> void:
	position += speed * delta
	
