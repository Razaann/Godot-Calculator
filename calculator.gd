extends Control

@onready var label_result = $MarginContainer/VBoxContainer/VBoxContainer/labelResult
@onready var label_value = $MarginContainer/VBoxContainer/VBoxContainer/labelResult2

var status: bool = true
var operator: String = ""
var prevValue: float


func ubah_label(angka: String):
	if status == false:
		if label_result.text == "0":
			label_result.text = str(angka)
			
		elif label_result.text.length() > 11:
			pass
			
		else:
			var result = label_result.text + str(angka)
			label_result.text = str(result)
	else:
		label_result.text = str(angka)
		status = false

func _on_button_9_pressed():
	ubah_label("9")


func _on_button_8_pressed():
	ubah_label("8")


func _on_button_7_pressed():
	ubah_label("7")


func _on_button_6_pressed():
	ubah_label("6")


func _on_button_5_pressed():
	ubah_label("5")


func _on_button_4_pressed():
	ubah_label("4")


func _on_button_3_pressed():
	ubah_label("3")


func _on_button_2_pressed():
	ubah_label("2")


func _on_button_1_pressed():
	ubah_label("1")


func _on_button_0_pressed():
	ubah_label("0")


func _on_button_clear_pressed():
	label_result.text = str(0)
	operator = ""
	prevValue = 0.0


func _on_button_backspace_pressed():
	if label_result.text.length() > 1:
		label_result.text = str(label_result.text.substr(0, label_result.text.length() - 1))
	else:
		label_result.text = str(0)


func _on_button_point_pressed():
	if label_result.text != "0" and not label_result.text.contains("."):
		ubah_label(".")


func _on_button_equals_pressed():
	if operator == "":
		return
	
	var operand1 = prevValue
	var operand2 = float(label_result.text)
	var result: float = 0.0
	
	if operator == "+":
		result = operand1 + operand2
	elif operator == "-":
		result = operand1 - operand2
	elif operator == "x":
		result = operand1 * operand2
	elif operator == "/":
		if operand2 == 0:
			label_result.text = "Error"
			return
		result = operand1 / operand2
	
	label_value.text = _format_for_label(operand1) + " " + operator + " " + _format_for_label(operand2)
	label_result.text = _format_result(result)
	
	operator = ""
	status = true
	prevValue = 0.0

func _format_for_label(value: float) -> String:
	# Check if it's an integer
	if value == int(value):
		return str(int(value))
	return str(value)

func _format_result(value: float) -> String:
	if value == int(value):
		return str(int(value))
	
	var result_str = str(value)
	
	if result_str.length() > 11:
		result_str = result_str.substr(0, 11)
	
	return result_str


func _on_button_plus_pressed():
	if operator != "":
		_on_button_equals_pressed()
	
	status = true
	operator = "+"
	prevValue = float(label_result.text)
	
	label_value.text = _format_for_label(prevValue) + " +"
	label_result.text = "0"


func _on_button_minus_pressed():
	if operator != "":
		_on_button_equals_pressed()
	
	status = true
	operator = "-"
	prevValue = float(label_result.text)
	
	label_value.text = _format_for_label(prevValue) + " -"
	label_result.text = "0"


func _on_button_times_pressed():
	if operator != "":
		_on_button_equals_pressed()
	
	status = true
	operator = "x"
	prevValue = float(label_result.text)
	
	label_value.text = _format_for_label(prevValue) + " x"
	label_result.text = "0"


func _on_button_divide_pressed():
	if operator != "":
		_on_button_equals_pressed()
	
	status = true
	operator = "/"
	prevValue = float(label_result.text)
	
	label_value.text = _format_for_label(prevValue) + " /"
	label_result.text = "0"
