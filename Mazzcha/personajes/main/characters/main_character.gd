extends CharacterBody2D

@onready var sprite = $sprite
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

@export var MAX_HEALTH : float = 10


func _ready():
	animation_player.play("idle_swordman")


var health : float = MAX_HEALTH:
	set(value):
		health = value
		_update_progress_bar()
		
func _update_progress_bar():
	health_bar.value = (health/MAX_HEALTH) * 100
	
