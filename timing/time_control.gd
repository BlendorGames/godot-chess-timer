extends Control

# Tugunlarni kodga bog'lab olamiz
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var button: Button = $Button
@onready var button_two: Button = $Button_two
# Hozirgi soniyani hisoblab boruvchi o'zgaruvchi
var count: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# O'yin boshlanganda label matnini 0 qilib qo'yamiz
	label.text = "0"
	button_two.text = "Pause" # Tugma matnini boshida "Pause" qilamiz
	# Signal keltirib ulash (buni indikatordan (Node) ulasangiz ham bo'ladi)
	button.pressed.connect(_on_button_pressed)
	button_two.pressed.connect(_on_pause_button_pressed)
	timer.timeout.connect(_on_timer_timeout)
	
func _on_pause_button_pressed():
	# Agar taymer ishlayotgan bo'lsa (va pauza bo'lmasa)
	if timer.is_stopped() == false and timer.paused == false:
		timer.paused = true       # Taymerni vaqtincha muzlatamiz
		button_two.text = "Resume" # Tugma matnini "Davom etish"ga o'zgartiramiz
	
	# Agar taymer pauzada turgan bo'lsa
	elif timer.paused == true:
		timer.paused = false      # Pauzadan chiqaramiz
		button_two.text = "Pause" # Tugma matnini yana "Pause" qilamiz
# Start tugmasi bosilganda
func _on_button_pressed() -> void:
	count = 0        # Sanashni boshidan boshlaymiz
	label.text = "0" # Labelni yangilaymiz
	timer.paused = false       # Agar pauzada bo'lsa, uni yechamiz
	timer.start()    # Taymerni ishga tushiramiz

# Har 1 soniyada taymer signali ishlaganda
func _on_timer_timeout() -> void:
	count += 1
	label.text = str(count)
	
	if count >= 10:
		timer.stop()
		button_two.text = "Pause" # 10 ga yetganda tugmani ham asl holiga keltiramiz
