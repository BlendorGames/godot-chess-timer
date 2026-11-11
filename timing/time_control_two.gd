extends Control

# Tugunlarni kodga bog'lab olamiz
@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var button: Button = $Button
@onready var button_two: Button = $Button_two

# Endi soniya va daqiqa uchun alohida o'zgaruvchilar ochamiz
var seconds: int = 0
var minutes: int = 0

func _ready() -> void:
	# Boshlanishida label matnini "00:00" formatida ko'rsatamiz
	update_label_text()
	button_two.text = "Pause"
	
	# Signallarni ulash
	button.pressed.connect(_on_button_pressed)
	button_two.pressed.connect(_on_pause_button_pressed)
	timer.timeout.connect(_on_timer_timeout)
	
func _on_pause_button_pressed():
	if timer.is_stopped() == false and timer.paused == false:
		timer.paused = true       
		button_two.text = "Resume" 
	elif timer.paused == true:
		timer.paused = false      
		button_two.text = "Pause" 

# Start tugmasi bosilganda
func _on_button_pressed() -> void:
	seconds = 0        # Soniyani nollaymiz
	minutes = 0        # Daqiqani nollaymiz
	update_label_text() 
	timer.paused = false       
	button_two.text = "Pause"
	timer.start()    

# Har 1 soniyada taymer signali ishlaganda
func _on_timer_timeout() -> void:
	seconds += 1 # Har soniyada sekundga 1 qo'shiladi
	
	# Mantiq: Agar sekund 60 ga yetsa, uni 0 qilib, daqiqaga 1 qo'shamiz
	if seconds >= 60:
		seconds = 0
		minutes += 1
		
	update_label_text() # Ekranni yangilaymiz
	
	# Agar masalan 10 daqiqa bo'lsa to'xtatmoqchi bo'lsangiz, shartni shunday yozasiz:
	# if minutes >= 10:
	#     timer.stop()
	#     button_two.text = "Pause"

# Vaqtni chiroyli "00:00" formatiga keltiruvchi yordamchi funksiya
func update_label_text() -> void:
	label.text = "%02d:%02d" % [minutes, seconds]
