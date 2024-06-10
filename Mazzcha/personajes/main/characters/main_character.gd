extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

const base_atk = config.Config.swordman_base_atk
const base_armor = config.Config.swordman_base_armor
const base_health = config.Config.swordman_base_health

var atk : int
var armor : int
var _health : float

func _ready():
	var level_multiplier = data.level
	atk = base_atk * level_multiplier
	armor = base_armor * level_multiplier
	health = base_health * level_multiplier

	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	animation_player.play("swordman_idle")
	_update_progress_bar()

func _update_progress_bar():
	health_bar.value = (health / (base_health * data.level)) * 100

func _atk1() -> int:
	animation_player.play("swordman_atk1")
	return atk

func _atk2() -> int:
	animation_player.play("swordman_atk2")
	health = health - atk*0.2 * (1 - armor / 100.0) # Recoil
	return atk*1.5
	

func _ability() -> int:
	animation_player.play("swordman_ability")
	return atk

func _hurt(damage: int):
	health -= damage
	animation_player.play("swordman_hurt")
	_update_progress_bar()

func _on_animation_finished(anim_name: String):
	if anim_name == "swordman_death":
		animation_player.pause()
	elif anim_name == "swordman_hurt" && health <= 0:
		animation_player.play("swordman_death")
		return
		
	if anim_name in ["swordman_atk1", "swordman_ability", "swordman_hurt"]:
		animation_player.play("swordman_idle")
	if anim_name == "swordman_atk2":
		animation_player.play("swordman_hurt")
	

func set_health(value):
	_health = value
	_update_progress_bar()

func get_health():
	return _health

var health : float:
	get = get_health,
	set = set_health
