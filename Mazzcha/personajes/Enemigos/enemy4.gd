extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

@export var MAX_HEALTH : float = 10


func _ready():
	animation_player.play("idle_king")


var health : float = MAX_HEALTH:
	set(value):
		#if(health > value):
			#animation_player.play()
			
		health = value
