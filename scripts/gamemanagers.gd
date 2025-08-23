extends Node

var pointss = 0 
@onready var points: Label = $"../txt/points"

func addscore():
	pointss += 5
	points.text = "score = "+str(pointss)
