extends TextureRect

var mountains = preload("res://assets/Players/names1.png")
var brackets = preload("res://assets/Players/names2.png")
var corners = preload("res://assets/Players/names3.png")
var storage = preload("res://assets/Players/names4.png")
var trenches = preload("res://assets/Players/names5.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _enter_tree():
	if get_tree().current_scene.name.to_lower() == "mountains":
		texture = mountains
	elif get_tree().current_scene.name.to_lower() == "brackets":
		texture = brackets
	elif get_tree().current_scene.name.to_lower() == "corners":
		texture = corners
	elif get_tree().current_scene.name.to_lower() == "storage":
		texture = storage
	elif get_tree().current_scene.name.to_lower() == "trenches":
		texture = trenches
