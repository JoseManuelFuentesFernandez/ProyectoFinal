extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

const base_atk = config.Config.enemy4_atk
const base_armor = config.Config.enemy4_armor
const base_health = config.Config.enemy4_health

var atk : int
var armor : int
var _health : float

func _ready():
	atk = base_atk
	armor = base_armor
	health = base_health
	
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	animation_player.play("king_idle")
	_update_progress_bar()

func _update_progress_bar():
	health_bar.value = (health / base_health) * 100

func _atk1() -> int:
	animation_player.play("king_atk1")
	return atk
	
func _atk2() -> int:
	animation_player.play("king_atk2")
	return atk*1.5

func _hurt(damage: int):
	health -= damage
	if health <= 0:
		health = 0
		animation_player.play("king_death")
	else:
		animation_player.play("king_hurt")
	_update_progress_bar()

func _on_animation_finished(anim_name: String):
	if anim_name == "king_death":
		pass
	elif anim_name in ["king_atk", "king_atk2", "king_hurt"]:
		animation_player.play("king_idle")

func set_health(value):
	_health = value
	_update_progress_bar()

func get_health():
	return _health

var health : float:
	get = get_health,
	set = set_health
