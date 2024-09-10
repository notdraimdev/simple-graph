extends Control

@onready var mode_container: Control = $ModeContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func hideExcept(TabID:String):
	var found:bool = false
	for child:Control in mode_container.get_children():
		if child.name.to_lower() == TabID.to_lower():
			child.show()
			found = true
		else:
			child.hide()
	if found == false:
		push_error("Invalid TabID")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
