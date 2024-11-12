extends Node

const ID = "Zea.Species"
onready var Lure = get_node("/root/SulayreLure")

# Predetermined colors for cosmetics
var cosmetic_colors = {
	"hat_baseball_cap": ["_big", "_exclaim", "_green", "_mcd", "_missing", "_orange", "_pee", "_size", "_sports"],
	"hat_beanie": ["_black", "_blue", "_green", "_maroon", "_teal", "_white", "_yellow"],
	"hat_bucket": ["_green", "_tan"],
	"hat_cowboyhat": ["_black", "_pink", "_brown"],
	"accessory_rain_boots": ["_green", "_yellow"],
	"accessory_shades": ["", "_gold"]
}

# Predetermined patterns (im gonna kill godot)
var default_patterns = [
	"pattern_collie", "pattern_calico", "pattern_spotted", "pattern_tux"
]

# Base folder path
var species_path = "res://mods/Zea.Species/Species/"

# Main function to load species data
func load_species_content():
	var dir = Directory.new()
	
	# Check if Species folder exists
	if dir.open(species_path) == OK:
		dir.list_dir_begin()
		
		# Loop through each species folder
		var species_folder = dir.get_next()
		while species_folder != "":
			if species_folder != "." and species_folder != ".." and dir.current_is_dir():
				var species_name = species_folder
				var species_id = ID + ".species_" + species_name.to_lower()
				var species_path_full = species_path + species_name + "/"
				
				# Load patterns
				load_patterns(species_id, species_name, species_path_full)
				
				# Load cosmetics
				load_cosmetics(species_id, species_name, species_path_full)
				
				# Load face animations
				load_face_animation(species_id, species_name, species_path_full)
				
				# Load species voices
				load_species_voice(species_id, species_name, species_path_full)
				
				# Add species content
				add_species_content(species_id, species_name, species_path_full)
			
			species_folder = dir.get_next()
		dir.list_dir_end()
	else:
		print("Could not find Species folder.")

# Function to load patterns using a predefined list
func load_patterns(species_id, species_name, species_path_full):
	var patterns_path = species_path_full + "Patterns/"
	
	# Iterate through the predefined list of patterns
	for pattern_name in default_patterns:
		var pattern_file = pattern_name + ".png"
		var full_pattern_path = "mod://Species/" + species_name + "/Patterns/" + pattern_file
		
		# Assign pattern texture using the predefined pattern name
		Lure.assign_pattern_texture(ID, pattern_name, species_id, full_pattern_path)

# Function to load cosmetics
func load_cosmetics(species_id, species_name, species_path_full):
	var cosmetics_path = species_path_full + "CosmeticMesh/"
	var dir = Directory.new()
	if dir.open(cosmetics_path) == OK:
		dir.list_dir_begin()
		var cosmetic_file = dir.get_next()
		
		while cosmetic_file != "":
			if cosmetic_file.ends_with(".mesh") or cosmetic_file.ends_with(".tres"):
				var cosmetic_name = cosmetic_file.replace(".mesh", "").replace(".tres", "")
				
				# Check if the cosmetic has predefined colors
				if cosmetic_colors.has(cosmetic_name):
					for color in cosmetic_colors[cosmetic_name]:
						Lure.assign_cosmetic_mesh(ID, cosmetic_name + color, species_id, "mod://Species/" + species_name + "/CosmeticMesh/" + cosmetic_file)
				else:
					# If no colors are defined, use the base cosmetic name
					Lure.assign_cosmetic_mesh(ID, cosmetic_name, species_id, "mod://Species/" + species_name + "/CosmeticMesh/" + cosmetic_file)
			
			cosmetic_file = dir.get_next()
		dir.list_dir_end()

# Function to load face animations
func load_face_animation(species_id, species_name, species_path_full):
	var face_animation_file = "mod://Species/" + species_name + "/" + species_name.to_lower() + "_face.tres"
	var dir = Directory.new()
	
	# Check if the face animation file exists
	if dir.file_exists(species_path_full + species_name.to_lower() + "_face.tres"):
		Lure.assign_face_animation(ID, species_id, face_animation_file)

# Function to load species voice
func load_species_voice(species_id, species_name, species_path_full):
	Lure.assign_species_voice(ID, species_id,
		"mod://Species/" + species_name + "/Voice/bark.ogg",
		"mod://Species/" + species_name + "/Voice/growl.ogg",
		"mod://Species/" + species_name + "/Voice/whine.ogg")

# Function to add species content
func add_species_content(species_id, species_name, species_path_full):
	Lure.add_content(ID, "species_" + species_name.to_lower(), "mod://Species/" + species_name + "/species_" + species_name.to_lower() + ".tres")

# Load content on ready
func _ready():
	load_species_content()
	print("[ZEA.SPECIES]: Species content loaded successfully!")
