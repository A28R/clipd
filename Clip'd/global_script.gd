extends Node

var p1roundswon=0
var p2roundswon=0

var p1inventory = 3
var p2inventory = 3

var lastRoundWinner = ""
var lastMatchWinner = ""
var lastArenaIndex = -1

func roundover(winner):
	if winner == "Player 1":
		lastRoundWinner = winner
		p1roundswon+=1
		
	elif winner == "Player 2":
		lastRoundWinner = winner
		p2roundswon +=1 
	
	if p1roundswon>=3:
		p1roundswon = 0
		p2roundswon = 0
		lastMatchWinner = "Player 1"
		get_tree().change_scene_to_file("res://scenes/ui/match_over.tscn")
	elif p2roundswon>=3:
		p1roundswon = 0
		p2roundswon = 0
		lastMatchWinner = "Player 2"
		get_tree().change_scene_to_file("res://scenes/ui/match_over.tscn")
		
	else:
		get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
		p1inventory = 3
		p2inventory = 3

func gameover(winner):
	if winner == "Player 1":
		lastMatchWinner = winner
	elif winner == "Player 2":
		lastMatchWinner = winner
	
	get_tree().change_scene_to_file("res://scenes/ui/game_over.tscn")
	p1inventory = 3
	p2inventory = 3
