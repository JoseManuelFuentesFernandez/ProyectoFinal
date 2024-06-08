extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	data.load_progress()
	print("Datos cargados en el menú: ", data.selected_character, data.level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://pantallas/seleccion_mazmorras/SeleccionMundo.tscn")

