extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_startAnimation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _startAnimation():
	play("idle_swordman")

