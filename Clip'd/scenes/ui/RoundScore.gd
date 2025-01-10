extends TextureRect

var blueball = preload("res://assets/UI/bubble3.png")
var redball = preload("res://assets/UI/bubble2.png")
var blackball = preload("res://assets/UI/bubble1.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	

	if len(Global.roundwinners)>=1:

		if Global.roundwinners[0]=="p1":
			$MarginContainer/HBoxContainer/MarginContainer/TextureRect.texture = redball
		else: 
			$MarginContainer/HBoxContainer/MarginContainer/TextureRect.texture = blueball
	else:
		$MarginContainer/HBoxContainer/MarginContainer/TextureRect.texture = blackball
		
	if len(Global.roundwinners)>=2:
		if Global.roundwinners[1]=="p1":
			$MarginContainer/HBoxContainer/MarginContainer2/TextureRect.texture = redball
		else: 
			$MarginContainer/HBoxContainer/MarginContainer2/TextureRect.texture = blueball
	else:
		$MarginContainer/HBoxContainer/MarginContainer2/TextureRect.texture = blackball
		
	if len(Global.roundwinners)>=3:
		if Global.roundwinners[2]=="p1":
			$MarginContainer/HBoxContainer/MarginContainer3/TextureRect.texture = redball
		else: 
			$MarginContainer/HBoxContainer/MarginContainer3/TextureRect.texture = blueball
	else:
		$MarginContainer/HBoxContainer/MarginContainer3/TextureRect.texture = blackball
		
	if len(Global.roundwinners)>=4:
		if Global.roundwinners[3]=="p1":
			$MarginContainer/HBoxContainer/MarginContainer4/TextureRect.texture = redball
		else: 
			$MarginContainer/HBoxContainer/MarginContainer4/TextureRect.texture = blueball
	else:
		$MarginContainer/HBoxContainer/MarginContainer4/TextureRect.texture = blackball
		
	if len(Global.roundwinners)>=5:
		if Global.roundwinners[4]=="p1":
			$MarginContainer/HBoxContainer/MarginContainer5/TextureRect.texture = redball
		else: 
			$MarginContainer/HBoxContainer/MarginContainer5/TextureRect.texture = blueball
	else:
		$MarginContainer/HBoxContainer/MarginContainer5/TextureRect.texture = blackball
		
