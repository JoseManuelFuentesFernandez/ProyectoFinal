extends Node2D

@onready var bg1 = $bg1
@onready var bg2 = $bg2
@onready var bg3 = $bg3
@onready var bg4 = $bg4
@onready var main_character = $MainCharacter
@onready var enemy = $enemy4

# Variable para almacenar el tipo de fondo
var bg_type: String

# Called when the node enters the scene tree for the first time.
func _ready():
	# Conectar la señal de cambio de fondo
	var scroll_container = get_tree().root.get_node("ScrollContainer") # Ajusta la ruta según tu estructura de escena
	if scroll_container:
		scroll_container.connect("change_background", Callable(self, "_on_change_background"))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_atk_1_pressed():
	main_character._atk1()

func _on_atk_2_pressed():
	pass # Replace with function body

func _on_ability_pressed():
	pass # Replace with function body

func _on_scape_pressed():
	pass # Replace with function body

func _on_change_background(bg_type: String):
	self.bg_type = bg_type
	set_background(bg_type)

func set_background(bg_type: String):
	bg1.visible = bg_type == "bg1"
	bg2.visible = bg_type == "bg2"
	bg3.visible = bg_type == "bg3"
	bg4.visible = bg_type == "bg4"

