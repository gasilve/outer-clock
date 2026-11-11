class_name DayClock
extends RefCounted

## Ordena las épocas una sola vez con una semilla y abre una época nueva
## solo cuando el calendario real avanza. Una fecha ya vista vuelve a su época.

const SAVE_PATH := "user://outer_clock_save.json"
const ERAS_PATH := "res://data/eras.json"

var seed_text: String = ""
var order: Array[String] = []
var by_date: Dictionary = {}
var day_offset: int = 0
var eras_by_id: Dictionary = {}

func _init() -> void:
	_load_eras()
	_load_save()


func clock_text() -> String:
	var t := Time.get_time_dict_from_system()
	return "%02d:%02d:%02d" % [t.hour, t.minute, t.second]


func story_date() -> String:
	return _date_with_offset(day_offset)


func current_era() -> Dictionary:
	var today := story_date()
	if by_date.has(today):
		return _era_or_echo(str(by_date[today]))

	var last := _latest_date()
	if last != "" and today < last:
		return _era_or_echo(str(by_date[last]))

	var used := {}
	for seen_date in by_date.keys():
		used[str(by_date[seen_date])] = true

	var next_id := ""
	for era_id in order:
		if not used.has(era_id):
			next_id = era_id
			break
	if next_id == "":
		next_id = "eco"

	by_date[today] = next_id
	_write_save()
	return _era_or_echo(next_id)


func advance_debug_day() -> void:
	day_offset += 1
	_write_save()


func rewind_debug_day() -> void:
	day_offset -= 1
	_write_save()


func reset_save() -> void:
	seed_text = ""
	order.clear()
	by_date.clear()
	day_offset = 0
	_create_fresh_save()


func _era_or_echo(era_id: String) -> Dictionary:
	if eras_by_id.has(era_id):
		return eras_by_id[era_id]
	return {
		"id": "eco",
		"titulo": "El taller, de nuevo",
		"cuando": "Las épocas ya se vivieron",
		"rol": "El reloj sigue andando. No queda una época nueva para esta fecha.",
	}


func _load_eras() -> void:
	var file := FileAccess.open(ERAS_PATH, FileAccess.READ)
	if file == null:
		push_error("No se pudo leer %s" % ERAS_PATH)
		return
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	file.close()
	if typeof(parsed) != TYPE_DICTIONARY:
		push_error("eras.json no es un objeto")
		return
	for era in parsed.get("epocas", []):
		eras_by_id[str(era.get("id", ""))] = era


func _load_save() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		_create_fresh_save()
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		_create_fresh_save()
		return
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	file.close()
	if typeof(parsed) != TYPE_DICTIONARY or parsed.is_empty():
		_create_fresh_save()
		return
	seed_text = str(parsed.get("seed", ""))
	day_offset = int(parsed.get("day_offset", 0))
	by_date = parsed.get("by_date", {})
	order.clear()
	for era_id in parsed.get("order", []):
		order.append(str(era_id))
	if order.is_empty():
		_create_fresh_save()


func _create_fresh_save() -> void:
	var now := Time.get_datetime_string_from_system(false, true)
	seed_text = "%s|%s" % [now, str(randi())]
	order = _shuffled_ids(seed_text)
	by_date = {}
	day_offset = 0
	_write_save()


func _shuffled_ids(seed_value: String) -> Array[String]:
	var ids: Array[String] = []
	for era_id in eras_by_id.keys():
		ids.append(str(era_id))
	var rng := RandomNumberGenerator.new()
	rng.seed = int(hash(seed_value)) & 0x7fffffff
	for i in range(ids.size() - 1, 0, -1):
		var j := rng.randi_range(0, i)
		var swap := ids[i]
		ids[i] = ids[j]
		ids[j] = swap
	return ids


func _write_save() -> void:
	var payload := {
		"seed": seed_text,
		"order": order,
		"by_date": by_date,
		"day_offset": day_offset,
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("No se pudo guardar la partida")
		return
	file.store_string(JSON.stringify(payload, "\t"))
	file.close()


func _latest_date() -> String:
	var latest := ""
	for seen_date in by_date.keys():
		var text := str(seen_date)
		if text > latest:
			latest = text
	return latest


func _date_with_offset(offset_days: int) -> String:
	var dict := Time.get_date_dict_from_system()
	dict["hour"] = 12
	dict["minute"] = 0
	dict["second"] = 0
	var unix := int(Time.get_unix_time_from_datetime_dict(dict)) + offset_days * 86400
	var shifted := Time.get_datetime_dict_from_unix_time(unix)
	return "%04d-%02d-%02d" % [int(shifted.year), int(shifted.month), int(shifted.day)]
