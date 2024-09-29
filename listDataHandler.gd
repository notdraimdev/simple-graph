extends Resource

class ListModeData:
	var colors:Dictionary
	var title:String
	var lists:Array

class ListData:
	var title:String
	var description:String
	var items:Array

class ItemData:
	var title:String
	var description:String
	var colors:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var listdata:ListModeData = ListModeData.new()
	var List = ListData.new()
	listdata.lists.append(List)
	var item = ItemData.new()
	List.items.append(item)
	var file = FileAccess.open("user://data.dat", FileAccess.WRITE)
	ResourceSaver.save(List,"user://data.tres")
	print(ResourceLoader.load("user://data.tres"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
