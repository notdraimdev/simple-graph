extends PanelContainer

@onready var name_edit: LineEdit = $MainContainer/Head/NameEdit
@onready var item_container: BoxContainer = $MainContainer/ItemContainer

const ITEM = preload("res://item.tscn")

var ListName:String
var items:Array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name_edit.text = ListName
	for item in items:
		var newitem = ITEM.instantiate()
		item_container.add_child(newitem)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
