extends CanvasLayer

signal initGame

func viewMessage(text):
	$Message.text=text
	$Message.show()
	$MessageTimer.start()
	
func gameOver():
	viewMessage("Game Over")
	yield($MessageTimer,"timeout")
	$Button.show()
	$Message.text="Space Wreck"
	$Message.show()

func updateScore(points):
	$ScoreLabel.text=str(points)
	

func _on_MessageTimer_timeout():
	$Message.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("initGame")
