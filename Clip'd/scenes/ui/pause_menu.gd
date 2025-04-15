extends CanvasLayer

func _input(event : InputEvent):
	if event.is_action_pressed("ui_cancel"):
		#if current_scene.is_paused():
		pass

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
