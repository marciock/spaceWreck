extends Node

export (PackedScene) var Asteroid
var Score


func _ready():
	randomize()
func newGame():
	Score=0
	$Player.inicialization($Position2D.position)
	$InitTimer.start()
	$Interface.viewMessage("Ready!")
	$Interface.updateScore(Score)




func game_over():
	$ScoreTimer.stop()
	$AsteroidTimer.stop()
	$Interface.gameOver()


func _on_InitTimer_timeout():
	$AsteroidTimer.start()
	$ScoreTimer.start()
	


func _on_ScoreTimer_timeout():
	Score +=10
	$Interface.updateScore(Score)
	
	


func _on_AsteroidTimer_timeout():
	$PathAsteroid/AsteroidPosition.set_offset(randi())
	
	var A=Asteroid.instance()
	add_child(A)
	
	var d =$PathAsteroid/AsteroidPosition.rotation + PI/2
	A.position=$PathAsteroid/AsteroidPosition.position
	d +=rand_range(-PI/4,PI/4)
	A.rotation=d
	A.set_linear_velocity(Vector2(rand_range(A.velocityMin,A.velocityMax),0).rotated(d))
	
	
	
	
	
