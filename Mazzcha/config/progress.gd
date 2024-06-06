class_name Progress
extends Resource

# 0 swordman | 1 archer | 2 wizard | -1 not selected yet
@export var _selected_character : int = -1
@export var _level : int = 1

func _init():
	pass

# Property for selected_character
func get_selected_character() -> int:
	return _selected_character

func set_selected_character(value: int) -> void:
	_selected_character = value

@export var selected_character : int:
	get = get_selected_character, set = set_selected_character

# Property for level
func get_level() -> int:
	return _level

func set_level(value: int) -> void:
	_level = value

@export var level : int:
	get = get_level, set = set_level
