extends Control

class ListModeData:
	var colors:Dictionary
	var title:String
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

@onready var lists_container: HBoxContainer = $ScrollContainer/ListsContainer
const LIST_NODE = preload("res://ListNode.tscn")
const ITEM = preload("res://item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Save()
	Load()

func Save():
	var listdata:ListModeData = ListModeData.new()
	var List:ListData = ListData.new()
	List.title = "test"
	var item:ItemData = ItemData.new()
	List.items.append(item)
	listdata.lists.append(List)
	var file = FileAccess.open("user://save1.dat", FileAccess.WRITE)
	file.store_string(JSON.stringify(listdata.getData()))

func Load():
	var file = FileAccess.open("user://save1.dat", FileAccess.READ)
	var filetext:String = file.get_as_text()
	for child in lists_container.get_children():
		child.queue_free()
	print("text: " + str(filetext))
	var data:Dictionary = JSON.parse_string(filetext)
	for list in data["lists"]:
		var newlist = LIST_NODE.instantiate()
		newlist.ListName = list["title"]
		newlist.items = list["items"]
		lists_container.add_child(newlist)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
