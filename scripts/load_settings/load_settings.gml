// load_settings()
var a;
log("Load settings")
if (!file_exists_lib(data_directory + "settings.file")) return 0
buffer = buffer_import(data_directory + "settings.file")
// Recent songs
for (a = 0; a < 11; a += 1) {
    recent_song[a] = buffer_read_string()
    recent_song_time[a] = buffer_read_double()
}
// Preferences
check_update = buffer_read_byte()
show_welcome = buffer_read_byte()
theme = buffer_read_byte()
songfolder = buffer_read_string()
show_numbers = buffer_read_byte()
show_octaves = buffer_read_byte()
use_colored = buffer_read_byte()
show_keynames = buffer_read_byte()
show_keyboard = buffer_read_byte()
show_notechart = buffer_read_byte()
keysmax = buffer_read_byte()
mousewheel = buffer_read_byte()
changepitch = buffer_read_byte()
select_lastpressed = buffer_read_byte()
marker_follow = buffer_read_byte()
marker_pagebypage = buffer_read_byte()
marker_start = buffer_read_byte()
marker_end = buffer_read_byte()
buffer_read_byte() // record
buffer_read_byte() // record round
realvolume = buffer_read_byte()

// Midi import settings
w_midi_remember = buffer_read_byte()
w_midi_removesilent = buffer_read_byte()
w_midi_name = buffer_read_byte()
w_midi_name_patch = buffer_read_byte()
w_midi_maxheight = buffer_read_byte()
w_midi_tempo = buffer_read_byte()
w_midi_octave = buffer_read_byte()
// instruments
for (a = 0; a < 128; a += 1) {
    midi_ins[a, 1] = buffer_read_byte() // Instrument
	if (midi_ins[a, 1] = 255) // -1
		midi_ins[a, 1] = -1
    midi_ins[a, 2] = buffer_read_byte() // Octave
	if (midi_ins[a, 2] = 255) // -1
		midi_ins[a, 2] = -1
}
// drums
for (a = 24; a < 88; a += 1) {
    midi_drum[a, 1] = buffer_read_byte() // Instrument
	if (midi_drum[a, 1] = 255) // -1
		midi_drum[a, 1] = -1
    midi_drum[a, 2] = buffer_read_byte() // Key
	if (midi_drum[a, 2] = 255) // -1
		midi_drum[a, 2] = -1
}
// Midi export settings
buffer_read_byte() // w_midiexp_remember
buffer_read_byte() // w_midiexp_layers
buffer_read_byte() // w_midiexp_open
for (a = 0; a < 14; a += 1) {
     buffer_read_byte() // w_midiexp_patch[a]
     buffer_read_byte() // w_midiexp_kind[a]
     buffer_read_byte() // w_midiexp_oct[a]
}
buffer_read_byte() // w_midiexp_ignored
// Schematic export settings
sch_exp_walkway_block = buffer_read_byte()
sch_exp_walkway_data = buffer_read_byte()
sch_exp_circuit_block = buffer_read_byte()
sch_exp_circuit_data = buffer_read_byte()
sch_exp_ground_block = buffer_read_byte()
sch_exp_ground_data = buffer_read_byte()
sch_exp_layout = buffer_read_byte()
sch_exp_notesperrow = buffer_read_byte()
sch_exp_includelocked = buffer_read_byte()
sch_exp_compress = buffer_read_byte()
sch_exp_loop = buffer_read_byte()
sch_exp_glass = buffer_read_byte()
sch_exp_minecart = buffer_read_byte()
sch_exp_chest = buffer_read_byte()
for (a = 0; a < 20; a += 1) {
    sch_exp_ins_block[a] = buffer_read_byte()
    sch_exp_ins_data[a] = buffer_read_byte()
}

// Keyboard keys
for (a = 0; a < 88; a += 1) piano_key[a] = buffer_read_short()
// Warnings
warning_octaves = buffer_read_byte()
warning_instrument = buffer_read_byte()
warning_schematic = buffer_read_byte()
// 3.1.1
if (buffer_is_eof()) {
    buffer_delete(buffer)
    return 0
}
vers = buffer_read_string_int()
sch_exp_minecraft_old = buffer_read_byte()
//?
if (buffer_is_eof()) {
    buffer_delete(buffer)
    return 0
}
soundsystem = max(0, buffer_read_byte())
soundsystemuser = soundsystem

buffer_delete(buffer)
return 1
