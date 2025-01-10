extends HBoxContainer


@onready var clip1 = $MarginContainer/TextureRect1
@onready var clip2 = $MarginContainer2/TextureRect2
@onready var clip3 = $MarginContainer3/TextureRect3
@onready var clip4 = $MarginContainer4/TextureRect4
@onready var clip5 = $MarginContainer5/TextureRect5
@onready var clip6 = $MarginContainer6/TextureRect6
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.p1inventory ==0:
		clip1.visible = false
		clip2.visible = false
		clip3.visible = false
		clip4.visible = false
		clip5.visible = false
		clip6.visible = false
	elif Global.p1inventory ==1:
		clip1.visible = true
		clip2.visible = false
		clip3.visible = false
		clip4.visible = false
		clip5.visible = false
		clip6.visible = false
	elif Global.p1inventory ==2:
		clip1.visible = true
		clip2.visible = true
		clip3.visible = false
		clip4.visible = false
		clip5.visible = false
		clip6.visible = false
	elif Global.p1inventory ==3:
		clip1.visible = true
		clip2.visible = true
		clip3.visible = true
		clip4.visible = false
		clip5.visible = false
		clip6.visible = false
	elif Global.p1inventory ==4:
		clip1.visible = true
		clip2.visible = true
		clip3.visible = true
		clip4.visible = true
		clip5.visible = false
		clip6.visible = false
	elif Global.p1inventory ==5:
		clip1.visible = true
		clip2.visible = true
		clip3.visible = true
		clip4.visible = true
		clip5.visible = true
		clip6.visible = false
	elif Global.p1inventory ==6:
		clip1.visible = true
		clip2.visible = true
		clip3.visible = true
		clip4.visible = true
		clip5.visible = true
		clip6.visible = true
