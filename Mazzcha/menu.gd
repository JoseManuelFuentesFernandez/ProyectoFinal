extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_load_menu()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_load_menu():
	
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://pantallas/seleccion_mazmorras/SeleccionMundo.tscn")


