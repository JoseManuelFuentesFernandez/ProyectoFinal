extends Node

@onready var accept_dialog = $AcceptDialog
@onready var reset_dialog = $ResetDialog

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


func _on_reset_button_pressed():
	reset_dialog.popup_centered()


func _on_reset_dialog_confirmed():
	data.reset_progress()
	data.load_progress()


func _on_reset_dialog_canceled():
	reset_dialog.visible = false
