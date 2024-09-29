extends Control

class ListModeData:
	var colors:Dictionary = {}
	var title:String = "empty"
	var lists:Array
	func getData() -> Dictionary:
		var listsTemp:Array
		for list:ListData in lists:
			listsTemp.append(list.getData())
		var dict:Dictionary = {"colors":colors,
							"title":title,
							"lists":listsTemp}
		return dict

class ListData:
	var title:String
	var description:String
	var items:Array
	func getData() -> Dictionary:
		var itemsTemp:Array
		for item:ItemData in items:
			itemsTemp.append(item.getData())
		var dict:Dictionary = {"title":title,
							"description":description,
							"items":itemsTemp}
		return dict

class ItemData:
	var title:String
	var description:String
	var colors:Array
	func getData() -> Dictionary:
		var dict:Dictionary = {"title":title,
								"descriptiom":description,
								"colors":colors}
		return dict

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var json:JSON = JSON.new()
	var listdata:ListModeData = ListModeData.new()
	var List = ListData.new()
	listdata.lists.append(List)
	var item = ItemData.new()
	List.items.append(item)
	var file = FileAccess.open("user://data.dat", FileAccess.WRITE)
	file.store_var(json.stringify(listdata.getData()))
	var file2 = FileAccess.open("user://data.dat", FileAccess.READ)
	print("a " +  str(listdata.getData()))
	print("a " +  str(json.stringify(listdata.getData())))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
