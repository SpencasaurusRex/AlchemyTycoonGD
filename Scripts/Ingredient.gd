extends Sprite

class_name Ingredient

var subs = [];
var being_dragged = false

func _ready():
	if GameData.ingredient_info.has(self.name):
		subs.push_back(GameData.ingredient_info[self.name])
	else:
		print("Incorrectly named ingredient")
	self.connect("mouse_entered", DragDropController, "mouse_entered", [self])
	self.connect("mouse_exited", DragDropController, "mouse_exited", [self])
	self.connect("input_event", DragDropController, "input_event", [self])

func _init():
	pass

func on_drag_start():
	print("on_drag_start")
	being_dragged = true

func on_drag(candidates):
	print("on_drag")
#	var string = "Other candidates: "
#	for i in range(candidates.size()):
#		string += candidates[i].name + " "
#	print(string)
	 
	
func on_drop():
	return false


class Sub:
	
	var attrs = [];
	var unlocked_attrs = [true, false, false];
	var catalyst


	func _init(attr1, attr2, attr3, catalyst):
		attrs.push_front(attr1)
		attrs.push_front(attr2)
		attrs.push_front(attr3)
		self.catalyst = catalyst


	func dissolve():
		unlocked_attrs[1] = true


	func add(item):
		if item == catalyst: 
			unlocked_attrs[2] = true
			return true
		else: 
			return false