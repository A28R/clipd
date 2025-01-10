extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	$"321/PanelContainer".visible = true
	$"321/PanelContainer/CenterContainer/TextureRect".visible = true
	$"321/PanelContainer/CenterContainer/TextureRect2".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect3".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect4".visible = false
	await get_tree().create_timer(1).timeout
	$"321/PanelContainer/CenterContainer/TextureRect".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect2".visible = true
	$"321/PanelContainer/CenterContainer/TextureRect3".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect4".visible = false
	await get_tree().create_timer(1).timeout
	$"321/PanelContainer/CenterContainer/TextureRect".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect2".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect3".visible = true
	$"321/PanelContainer/CenterContainer/TextureRect4".visible = false
	await get_tree().create_timer(1).timeout
	$"321/PanelContainer/CenterContainer/TextureRect".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect2".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect3".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect4".visible = true
	
	await get_tree().create_timer(1).timeout
	$"321/PanelContainer/CenterContainer/TextureRect".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect2".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect3".visible = false
	$"321/PanelContainer/CenterContainer/TextureRect4".visible = false
	$"321/PanelContainer".visible = false
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
