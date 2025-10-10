extends Control

@onready var label_result = $VBoxContainer/labelResult
var status = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ubah_label(angka: int):
	if status == true:
		if label_result.text == "0":
			label_result.text = str(angka)
		
		elif label_result.text.length() > 12:
			pass
			
		else:
			var result = label_result.text + str(angka)
			label_result.text = str(result)

func _on_button_9_pressed():
	ubah_label(9)


func _on_button_8_pressed():
	ubah_label(8)


func _on_button_7_pressed():
	ubah_label(7)


func _on_button_6_pressed():
	ubah_label(6)


func _on_button_5_pressed():
	ubah_label(5)


func _on_button_4_pressed():
	ubah_label(4)


func _on_button_3_pressed():
	ubah_label(3)


func _on_button_2_pressed():
	ubah_label(2)


func _on_button_1_pressed():
	ubah_label(1)


func _on_button_0_pressed():
	ubah_label(0)


func _on_button_clear_pressed():
	label_result.text = str(0)


func _on_button_backspace_pressed():
	if label_result.text.length() > 1:
		label_result.text = str(label_result.text.substr(0, label_result.text.length() - 1))
	else:
		label_result.text = str(0)
