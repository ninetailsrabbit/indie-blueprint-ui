extends Control

@onready var shrink_button: Button = $ShrinkButton
@onready var pop_button: Button = $PopButton

@onready var panel: Panel = $Panel



func _ready() -> void:
	shrink_button.pressed.connect(on_shrink_button_pressed)
	pop_button.pressed.connect(on_pop_button_pressed)
	
	
func on_shrink_button_pressed() -> void:
	IndieBlueprintUIAnimation.shrink(panel)


func on_pop_button_pressed() -> void:
	IndieBlueprintUIAnimation.pop(panel)
