class_name Progress
extends Node

const SAVE_GAME_PATH := "./data.json"

@export var selected_character : int
@export var level : int

func _init():
	# Intenta cargar los datos al inicializar la clase
	load_progress()

# Método para guardar los datos en el archivo JSON
func save_progress():
	var data = {
		"selected_character": selected_character,
		"level": level
	}
	
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.new().stringify(data))
		file.close()
		print("Datos guardados exitosamente en %s" % SAVE_GAME_PATH)
	else:
		print("Error al abrir el archivo para guardar datos.")

# Método para cargar los datos desde el archivo JSON
func load_progress():
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
	if file:
		var json = JSON.new()
		var error = json.parse(file.get_as_text())
		if error == OK:
			var json_data = json.data
			selected_character = json_data.get("selected_character", -1)
			level = json_data.get("level", 1)
			print("Datos cargados exitosamente desde %s" % SAVE_GAME_PATH)
		else:
			print("Error al parsear el JSON: %s en la línea %d" % [json.get_error_message(), json.get_error_line()])
		file.close()
	else:
		print("El archivo %s no existe o no se pudo abrir." % SAVE_GAME_PATH)

# Método para resetear el progreso
func reset_progress():
	selected_character = -1
	level = 1
	save_progress()
	print("Progreso reseteado.")
