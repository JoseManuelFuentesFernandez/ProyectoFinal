extends Node2D

@onready var bg2 = $bg2
@onready var main_character = $MainCharacter
@onready var enemy = $Enemy2
@onready var options = $CanvasLayer/options
@onready var exit_confirmation_dialog = $ExitConfirmationDialog
@onready var result_dialog = $ResultDialog


var is_player_turn = true
var turn_timer = 5.0

func _ready():
	set_process(true)
	_start_player_turn()

func _process(delta):
	if main_character.health <= 0:
		result_dialog.title = "Derrota"
		result_dialog.dialog_text = "Has perdido..."
		result_dialog.ok_button_text = "Salir"
		result_dialog.popup_centered()
		return

	if enemy.health <= 0:
		result_dialog.title = "Victoria"
		result_dialog.ok_button_text = "Continuar"
		if data.level < 3:
			result_dialog.dialog_text = "¡Has ganado y subido de nivel!"
			data.level = 3
			data.save_progress()
		else:
			result_dialog.dialog_text = "¡Has ganado!"
		
		result_dialog.popup_centered()
		return

	if !is_player_turn:
		turn_timer -= delta
		if turn_timer <= 0:
			_enemy_turn()

func _on_atk_1_pressed():
	if is_player_turn:
		var damage = main_character._atk1()
		enemy._hurt(_calculate_damage(damage, enemy.armor))
		_end_player_turn()

func _on_atk_2_pressed():
	if is_player_turn:
		var damage = main_character._atk2()
		enemy._hurt(_calculate_damage(damage, enemy.armor))
		_end_player_turn()

func _on_ability_pressed():
	if is_player_turn:
		var damage = main_character._ability()
		enemy._hurt(_calculate_damage(damage, enemy.armor))
		_end_player_turn()

func _calculate_damage(atk, armor):
	return atk * (1 - armor / 100.0)

func _start_player_turn():
	is_player_turn = true
	turn_timer = 5.0
	options.visible = true

func _end_player_turn():
	is_player_turn = false
	turn_timer = 5.0
	options.visible = false

func _enemy_turn():
	var attack_type = randi() % 2
	var damage
	match attack_type:
		0:
			damage = enemy._atk1()
		1:
			damage = enemy._atk2()
	main_character._hurt(_calculate_damage(damage, main_character.armor))
	if main_character.health > 0:
		_start_player_turn()

func _on_scape_pressed():
	exit_confirmation_dialog.popup_centered()
	exit_confirmation_dialog.connect("confirmed", Callable(self, "_on_exit_confirmed"))

func _on_exit_confirmed():
	get_tree().change_scene_to_file("res://pantallas/menu/MenuPrincipal.tscn")

func _on_result_dialog_confirmed():
	get_tree().change_scene_to_file("res://pantallas/menu/MenuPrincipal.tscn")

