extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

const base_atk = config.Config.enemy1_atk
const base_armor = config.Config.enemy1_armor
const base_health = config.Config.enemy1_health

var atk : int
var armor : int
var _health : float

func _ready():
	atk = base_atk
	armor = base_armor
	health = base_health
	
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	animation_player.play("enemy1_idle")
	_update_progress_bar()

func _update_progress_bar():
	health_bar.value = (health / base_health) * 100

func _atk1() -> int:
	animation_player.play("enemy1_atk")
	return atk
	
func _hurt(damage: int):
	health -= damage
	animation_player.play("enemy1_hurt")
	_update_progress_bar()

func _on_animation_finished(anim_name: String):
	if anim_name == "enemy1_death":
		animation_player.pause()
	elif anim_name == "enemy1_hurt" && health <= 0:
		animation_player.play("enemy1_death")
		return
	elif anim_name in ["enemy1_atk","enemy1_hurt"]:
		animation_player.play("enemy1_idle")

func set_health(value):
	_health = value
	_update_progress_bar()

func get_health():
	return _health

var health : float:
	get = get_health,
	set = set_health
