extends Node

var p1roundswon=0
var p2roundswon=0

var p1inventory = 3
var p2inventory = 3

var lastRoundWinner = ""
var lastArenaIndex = -1

func roundover(winner):
	if winner == "Player 1":
		lastRoundWinner = winner
		p1roundswon+=1
	elif winner == "Player 2":
		lastRoundWinner = winner
		p2roundswon +=1 
	
	get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
	p1inventory = 3
	p2inventory = 3

func gameover(winner):
	if winner == "Player 1":
		pass
	elif winner == "Player 2":
		pass
	
	get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
	p1inventory = 3
	p2inventory = 3
