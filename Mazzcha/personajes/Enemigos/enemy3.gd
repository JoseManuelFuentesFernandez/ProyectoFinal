extends CharacterBody2D

@onready var sprite = $Sprite2D
@onready var health_bar = $health_bar
@onready var animation_player = $AnimationPlayer

const base_atk = config.Config.enemy3_atk
const base_armor = config.Config.enemy3_armor
const base_health = config.Config.enemy3_health

var atk : int
var armor : int
var _health : float
var rage = false

func _ready():
	atk = base_atk
	armor = base_armor
	health = base_health
	
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	animation_player.play("mino_idle")
	_update_progress_bar()

func _update_progress_bar():
	health_bar.value = (health / base_health) * 100
	if health_bar.value < 50 && !rage:
		rage = true
		atk = atk * 1.5
		animation_player.play("mino_ragle")

func _atk1() -> int:
	animation_player.play("mino_atk1")
	return atk*1.2
	
func _atk2() -> int:
	animation_player.play("mino_atk2")
	return atk
	
func _atk3() -> int:
	animation_player.play("mino_atk3")
	return atk*1.3

func _hurt(damage: int):
	health -= damage
	animation_player.play("mino_hurt")
	_update_progress_bar()

func _on_animation_finished(anim_name: String):
	if anim_name == "mino_death":
		animation_player.pause()
	elif anim_name == "mino_hurt" && health <= 0:
		animation_player.play("mino_death")
		return
	elif anim_name in ["mino_atk1", "mino_atk2", "mino_atk3", "mino_hurt"]:
		if rage:
			animation_player.play("mino_ragle")
		else:
			animation_player.play("mino_idle")
		

func set_health(value):
	_health = value
	_update_progress_bar()

func get_health():
	return _health

var health : float:
	get = get_health,
	set = set_health
