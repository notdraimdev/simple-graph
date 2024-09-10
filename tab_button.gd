class_name TabButton
extends Button
@export var TabID:String = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !TabID:
		push_error("Error: TabID empty on: %s" %name)
	else:
		pressed.connect(owner.CallChangeTabToID.bind(TabID))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
