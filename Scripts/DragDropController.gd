extends Node

var current = null
var drag_offset = Vector2()
var original_position = Vector2()

var candidates = []
var drop_candidates = []

export var drag_group = "draggable"

class_name DragDropController


func _process(delta):
	if current is Node:
		current.global_position = current.get_global_mouse_position() - drag_offset
		if current.has_method("on_drag"):
			current.on_drag(drop_candidates)


func mouse_entered(draggable):
	candidates.append(draggable)
	drop_candidates.append(draggable)
	pass


func mouse_exited(draggable):
	candidates.erase(draggable)
	drop_candidates.erase(draggable)
	pass


func input_event(viewport: Node, event: InputEvent, shape_idx: int, draggable: Node2D):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			candidates.sort_custom(self,"depth_sort")
			
			var last = candidates.back()
			if last:
				last.raise()
				current = last
				drop_candidates = candidates.duplicate()
				drop_candidates.pop_back()
				drag_offset = current.get_global_mouse_position() - current.global_position
				if current.has_method("on_drag_start"):
					current.on_drag_start()
		else:
			var can_drop = true
			if current:
				if current.has_method("on_drop"):
					var on_drop_result = current.on_drop()
					can_drop = on_drop_result == null || on_drop_result
				if can_drop:
					current = null


func depth_sort(a,b):
	return b.get_index() < a.get_index()