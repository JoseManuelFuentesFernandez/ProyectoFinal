extends Node2D

@onready var bg = $bg4
@onready var main_character = $MainCharacter
@onready var enemy = $enemy4

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_atk_1_pressed():
	main_character._atk1()


func _on_atk_2_pressed():
	pass # Replace with function body.


func _on_ability_pressed():
	pass # Replace with function body.


func _on_scape_pressed():
	pass # Replace with function body.
