extends Node3D

@onready var _clock_label: Label = $UI/Panel/Margin/VBox/ClockLabel
@onready var _era_label: Label = $UI/Panel/Margin/VBox/EraLabel
@onready var _detail_label: Label = $UI/Panel/Margin/VBox/DetailLabel
@onready var _hour_hand: Node3D = $Clock/HourPivot
@onready var _minute_hand: Node3D = $Clock/MinutePivot

var _clock := DayClock.new()


func _ready() -> void:
	_refresh()


func _process(_delta: float) -> void:
	var t := Time.get_time_dict_from_system()
	var hours := int(t.hour) % 12
	var hour_turn := (float(hours) + float(t.minute) / 60.0) / 12.0
	var minute_turn := (float(t.minute) + float(t.second) / 60.0) / 60.0
	_hour_hand.rotation.y = -hour_turn * TAU
	_minute_hand.rotation.y = -minute_turn * TAU
	_clock_label.text = "Reloj de afuera  %s\nFecha de la historia  %s" % [_clock.clock_text(), _clock.story_date()]


func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventKey and event.pressed and not event.echo):
		return
	var key := event as InputEventKey
	if key.keycode == KEY_F2:
		_clock.advance_debug_day()
		_refresh()
	elif key.keycode == KEY_F1:
		_clock.rewind_debug_day()
		_refresh()
	elif key.keycode == KEY_F5:
		_clock.reset_save()
		_refresh()


func _refresh() -> void:
	var era := _clock.current_era()
	_era_label.text = "%s\n%s" % [str(era.get("titulo", "")), str(era.get("cuando", ""))]
	_detail_label.text = str(era.get("rol", ""))
