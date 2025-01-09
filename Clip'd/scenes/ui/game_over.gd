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


func _on_back_to_home_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/start_screen.tscn")


func _on_random_arena_pressed():
	var randNum = randi_range(0,4)
	get_tree().change_scene_to_file(arenas[randNum])
