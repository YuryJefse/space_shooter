extends Control

func set_points(points:int)->void:
	$ScoreLabel.text =  "Score: " + str(points)
	
func set_lifes(lifes:int)->void:
	$LifesLabel.text = "Lifes: " + str(lifes)
