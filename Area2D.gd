extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ind1
var ind2
var label
var board
var is_empty = true
var player = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	ind1 = preload("res://Indicator.tscn")
	ind2 = preload("res://Player2.tscn")
	label = get_tree().get_root().get_node("/root/Board/Label")
	board = get_tree().get_root().get_node("/root/Board")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func make_indicator(turn):
	var new_indicator
	if turn == 1:
		new_indicator = ind1.instance()
		player = 1
	elif turn == 2:
		new_indicator = ind2.instance()
		player = 2
	new_indicator.position = self.position
	add_child(new_indicator)
	
func get_player():
	return player


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed && is_empty):
		is_empty = false
		var turn = board.get_turn()
		make_indicator(turn)
		board.change_turn()
