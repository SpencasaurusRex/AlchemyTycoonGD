extends Area2D

class_name IngredientDrag

var dragging = false
onready var root = get_tree().get_root().get_node("World")
onready var camera = root.get_node("Camera2D")
onready var parent = get_parent()
onready var viewport = get_viewport()

func _process(delta):
	if dragging:
		parent.set_position((viewport.get_mouse_position() - viewport.size / 2) * camera.zoom + camera.get_camera_position())
		#get_parent().set_position(viewport.get_mouse_position() * camera.zoom)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false