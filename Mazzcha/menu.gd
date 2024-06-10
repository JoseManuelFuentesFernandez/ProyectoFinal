extends Node

@onready var accept_dialog = $AcceptDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	data.load_progress()
	print("Datos cargados en el menú: ", data.selected_character, data.level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://pantallas/seleccion_mazmorras/SeleccionMundo.tscn")


func _on_exit_button_pressed():
	accept_dialog.popup_centered()


func _on_accept_dialog_confirmed():
	get_tree().quit()


func _on_accept_dialog_canceled():
	accept_dialog.visible = false

