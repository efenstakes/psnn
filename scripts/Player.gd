extends KinematicBody2D


# direction
export(Vector2) var direction : Vector2 = Vector2.ZERO

# its velocity
export(Vector2) var velocity : Vector2 = Vector2.ZERO

# its max speed
export(Vector2) var MAX_SPEED : Vector2 = Vector2(200, 400)

# acceleration
export(int) var acceleration := 4000


# screen size
export(Vector2) var SCREEN_SIZE := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	print("player loaded")
	SCREEN_SIZE = get_viewport().size
	print("size")
	print(SCREEN_SIZE)
	EventManager.connect("player_died", self, "_onPlayerDied")
	EventManager.connect("new_game", self, "_onNewGame")


func _physics_process(delta)-> void:
	if Input.is_action_pressed("ui_left"):
		velocity.x -= acceleration * delta
	elif Input.is_action_pressed("ui_right"):
		velocity.x += acceleration * delta
	else:
		velocity.x = lerp(velocity.x, 0, .5)
		
	# clamp it here
	velocity.x = clamp( velocity.x, -MAX_SPEED.x, MAX_SPEED.x )
	
	# move
	velocity = move_and_slide(velocity, Vector2.UP)
	
	
	
func _onNewGame()-> void:
	rotation = 0
	
func _onPlayerDied()-> void:
	rotation = -320
