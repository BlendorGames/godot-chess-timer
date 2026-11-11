extends Control
var ochko : int = 0
@onready var numbers_label : = $Label

func _ready() -> void:
	pass
	numbers_label.text =str(ochko)


func _on_button_pressed() -> void:
	pass # Replace with function body.
	ochko = ochko + 1
	numbers_label.text = str(ochko)
