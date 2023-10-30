extends Control

func set_points(points:int):
	$ScoreLabel.text =  "Score: " + str(points)
	
func set_lifes(lifes:int):
	$LifesLabel.text = "Lifes: " + str(lifes)
