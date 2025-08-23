extends Node

var score = 0
@onready var scorestuff: Label = $"../text/scorestuff"


func addpoint():
	score += 5
	scorestuff.text = "score = "+ str(score)
