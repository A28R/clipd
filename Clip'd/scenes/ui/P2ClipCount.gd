extends Label



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Player 2: " + str(Global.p2inventory) + " clips   P2 Rounds Won: " +str(Global.p2roundswon)
