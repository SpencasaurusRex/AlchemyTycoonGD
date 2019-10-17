extends Sprite

class_name Ingredient


enum Attribute { CharmingAura, DiseaseResistance, PerpetualHeat, LifeDrain, Spores, SealWounds, SoothingFragrance, Neutralize, Chilling, Vitalize, Fertilize, Grease }
var subs = [];


func _ready():
	pass


func _init(subs):
	self.subs = subs


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