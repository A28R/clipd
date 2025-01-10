extends CanvasLayer


var arenas = [
	"res://scenes/arenas/brackets.tscn",
	"res://scenes/arenas/corners.tscn",
	"res://scenes/arenas/mountains.tscn",
	"res://scenes/arenas/storage.tscn",
	"res://scenes/arenas/trenches.tscn"
]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_demo_pressed():
	get_tree().change_scene_to_file("res://demo_world.tscn")
	
func _on_brackets_pressed():
	get_tree().change_scene_to_file("res://scenes/arenas/brackets.tscn")


func _on_corners_pressed():
	get_tree().change_scene_to_file("res://scenes/arenas/corners.tscn")

func _on_mountains_pressed():
	get_tree().change_scene_to_file("res://scenes/arenas/mountains.tscn")

func _on_storage_pressed():
	get_tree().change_scene_to_file("res://scenes/arenas/storage.tscn")

func _on_trenches_pressed():
	get_tree().change_scene_to_file("res://scenes/arenas/trenches.tscn")



func _on_title_5_pressed():
	var randNum = randi_range(0,4)
	get_tree().change_scene_to_file(arenas[randNum])


func _on_okay_pressed():
	$ControlsPopup.visible = false



func _on_controls_pressed():
	$ControlsPopup.visible = true

