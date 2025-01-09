extends Label



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Player 1: " + str(Global.p1inventory) + " clips   P1 Rounds Won: " +str(Global.p1roundswon) 
