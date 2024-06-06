extends Node2D

@onready var bg1 = $bg1
@onready var bg2 = $bg2
@onready var bg3 = $bg3
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
	pass # Replace with function body

func _on_ability_pressed():
	main_character._hurt()

func _on_scape_pressed():
	get_tree().change_scene_to_file("res://pantallas/menu/MenuPrincipal.tscn")

