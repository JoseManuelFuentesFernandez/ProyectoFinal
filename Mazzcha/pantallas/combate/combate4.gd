extends Node2D

@onready var bg4 = $bg4
@onready var main_character = $MainCharacter
@onready var enemy = $enemy4



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_atk_1_pressed():
	main_character._atk1()

func _on_atk_2_pressed():
	main_character._atk2()

func _on_ability_pressed():
	main_character._hurt()

func _on_scape_pressed():
	get_tree().change_scene_to_file("res://pantallas/menu/MenuPrincipal.tscn")

