extends Node2D

var turn = 1
var label
var ind1
var ind2
var turn1_text = "Turn: Player 1"
var turn2_text = "Turn: Player 2"
var square_array = Array([0,0,0,0,0,0,0,0,0]) #player values of squares

# Called when the node enters the scene tree for the first time.
func _ready():
	ind1 = preload("res://Indicator.tscn")
	ind2 = preload("res://Player2.tscn")
	label = get_tree().get_root().get_node("/root/Board/Label")
	
func check_winner():
	if (square_array[0] == 1 && square_array[1] == 1 && square_array[2] == 1) \
	or (square_array[3] == 1 && square_array[4] == 1 && square_array[5] == 1) \
	or (square_array[6] == 1 && square_array[7] == 1 && square_array[8] == 1) \
	or (square_array[0] == 1 && square_array[3] == 1 && square_array[6] == 1) \
	or (square_array[1] == 1 && square_array[4] == 1 && square_array[7] == 1) \
	or (square_array[2] == 1 && square_array[5] == 1 && square_array[8] == 1) \
	or (square_array[0] == 1 && square_array[4] == 1 && square_array[8] == 1) \
	or (square_array[2] == 1 && square_array[4] == 1 && square_array[6] == 1):
		label.text = "player 1 wins!"
	elif (square_array[0] == 2 && square_array[1] == 2 && square_array[2] == 2) \
	or (square_array[3] == 2 && square_array[4] == 2 && square_array[5] == 2) \
	or (square_array[6] == 2 && square_array[7] == 2 && square_array[8] == 2) \
	or (square_array[0] == 2 && square_array[3] == 2 && square_array[6] == 2) \
	or (square_array[1] == 2 && square_array[4] == 2 && square_array[7] == 2) \
	or (square_array[2] == 2 && square_array[5] == 2 && square_array[8] == 2) \
	or (square_array[0] == 2 && square_array[4] == 2 && square_array[8] == 2) \
	or (square_array[2] == 2 && square_array[4] == 2 && square_array[6] == 2):
		label.text = "player 2 wins!"
	#TODO make this in a smart way
	
func change_turn():
	if turn == 1:
		label.text = turn2_text
		turn = 2
	elif turn == 2:
		label.text = turn1_text
		turn = 1
	var node1 = get_node("squares")
	var squares = node1.get_children()
	for i in range (squares.size()):
		square_array[i] = squares[i].get_node("Area2D").player
	check_winner()
		
func get_turn():
	return turn

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

