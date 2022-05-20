extends CanvasLayer

var time = 0
var timer_on = false

func _process(delta):
	if(timer_on):
		time += delta

func _on_Quit_pressed():
	get_tree().quit()

func _on_Play_pressed():
	Global.Playing = true
	$Control.visible = false
	get_tree().paused = false
	time = 0
	timer_on = true

func _on_Score_pressed():
	$Control.visible = false
	$Score.visible = true
	$Score/Message.text = Global.HighScore


func _on_Back_pressed():
	get_tree().reload_current_scene()

func _on_DeathZone_dead():
	Global.Playing = false
	$Score.visible = true
	timer_on = false
	$Score/Message.text = "Вы проиграли"


func _on_VictoryZone_win():
	Global.Playing = false
	$Score.visible = true
	timer_on = false
	$Score/Message.text = "Вы выйграли"
	$Score/ScoreLabel.text = "Ваш результат: " + var2str(time)
	Global.HighScore = "Ваш последний результат: " + var2str(time)
	get_tree().paused = true
