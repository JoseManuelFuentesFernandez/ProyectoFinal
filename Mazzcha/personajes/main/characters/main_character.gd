extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

@export var MAX_HEALTH : float = 10

var health : float = MAX_HEALTH:
	set(value):
		#if(health > value):
			#animation_player.play()
			
		health = value
		_update_progress_bar()
		

var progress : Progress

func _ready():
	progress = Progress.new()
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	animation_player.play("swordman_idle")
	
	
func _update_progress_bar():
	health_bar.value = (health/MAX_HEALTH) * 100
	
func _atk1():
	animation_player.play("swordman_atk1")
	
func _on_animation_finished(anim_name: String):
	if anim_name == "swordman_atk1":
		animation_player.play("swordman_idle")
