extends Control
@onready var label_one : Label = $Label
@onready var label_two : Label = $Label2
@onready var button_player_one : Button = $Button
@onready var button_player_two : Button = $Button3
@onready var button_player_reset : Button = $Button2
#@onready var button_player_pause : Button = $Button4
@onready var timer_one_player : Timer = $Timer
@onready var timer_two_player : Timer = $Timer2
@onready var audio_player_start : AudioStreamPlayer = $AudioStreamPlayer_start
@onready var audio_player_stop : AudioStreamPlayer = $AudioStreamPlayer_stop
#var returner_audio : bool = false
var seconds_for_one_player: int = 0
var minutes_for_one_player: int = 0
var seconds_for_two_player: int = 0
var minutes_for_two_player: int = 0
var spinner : bool = true
var stopper_one : bool = false
var stopper_two : bool = false
func _ready():
	pass
	button_player_one.pressed.connect(button_one_pressed)
	button_player_two.pressed.connect(button_two_pressed)
	button_player_reset.pressed.connect(button_reset_pressed)
	timer_one_player.timeout.connect(_on_timer_timeout_one_player)
	timer_two_player.timeout.connect(_on_timer_timeout_two_player)
func button_one_pressed():
	if !stopper_two:
		if spinner:
			seconds_for_one_player = 0
			minutes_for_one_player = 0
			spinner = false
			audio_player_start.play()
		if timer_two_player.is_stopped() == false and timer_two_player.paused == false:
			pass
			timer_two_player.paused = true
		update_label_text_one() 
		timer_one_player.paused = false
		timer_one_player.start()
		button_player_one.text = "Playing"
		button_player_two.text = "Pause"  
		stopper_two = true
		stopper_one = false
	else:
		return
		
func button_two_pressed():
	if !stopper_one:
		if spinner:
			seconds_for_two_player = 0
			minutes_for_two_player = 0
			spinner = false
			audio_player_start.play()
		if timer_one_player.is_stopped() == false and timer_one_player.paused == false:
			pass
			timer_one_player.paused = true
			
		update_label_text_two()
		timer_two_player.paused = false
		timer_two_player.start()
		button_player_two.text = "Playing"
		button_player_one.text = "Pause"  
		stopper_two = false
		stopper_one = true
	else:
		return

func button_reset_pressed():
	audio_player_stop.play()
	audio_player_start.stop()
	seconds_for_one_player = 0
	minutes_for_one_player = 0
	seconds_for_two_player = 0
	minutes_for_two_player = 0
	spinner = true
	stopper_two = false
	stopper_one = false
	button_player_two.text = "Pause"
	button_player_one.text = "Pause"  
	timer_one_player.stop()
	timer_two_player.stop()
	label_one.text = "00:00"
	label_two.text = "00:00"

func _on_timer_timeout_one_player():
	seconds_for_one_player += 1
	if seconds_for_one_player >= 60:
		seconds_for_one_player = 0
		minutes_for_one_player += 1
	update_label_text_one()

func _on_timer_timeout_two_player():
	seconds_for_two_player += 1
	if seconds_for_two_player >= 60:
		seconds_for_two_player = 0
		minutes_for_two_player += 1
	update_label_text_two()

func update_label_text_one():
	label_one.text = "%02d:%02d" % [minutes_for_one_player, seconds_for_one_player]
	
func update_label_text_two():
	label_two.text = "%02d:%02d" % [minutes_for_two_player, seconds_for_two_player]

func audio_start():
	pass
	audio_player_start.play()
	
func audio_stop():
	pass
	audio_player_stop.play()
