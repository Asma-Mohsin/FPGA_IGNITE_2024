import math

ignore_strings = ["BlockRAM", "cvxif_pau", "data_mem"]

def rotate(origin, point, angle):
    """
    Rotate a point counterclockwise by a given angle around a given origin.

    The angle should be given in radians.
    """
    ox, oy = origin
    px, py = point

    qx = ox + math.cos(angle) * (px - ox) - math.sin(angle) * (py - oy)
    qy = oy + math.sin(angle) *  (px - ox) + math.cos(angle) * (py - oy)
    return qx, qy

def read_tiles(file_path):
    """
    Reads the input file and extracts tile information into a list of dictionaries.

    Parameters:
        file_path (str): Path to the input file.

    Returns:
        list: A list of dictionaries with tile data (e.g., [{'name': value, 'x': value, ...}]).
    """
    tiles = []
    with open(file_path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if line.strip() and not line.startswith(" "):
                parts = line.strip().split()
                name = parts[0]
                x, y = map(float, parts[1:3])  # Assuming x, y coordinates are the 2nd and 3rd columns
                flip = parts[3]
                tiles.append({'name': name, 'x': x, 'y': y, "flip": flip})
    return tiles

def print_tiles(tiles):
    """
    Prints the tile data in a readable format.

    Parameters:
        tiles (list): A list of dictionaries with tile data.
    """
    for tile in tiles:
        print(f"TILE name: {tile['name']} x: {tile['x']}, y: {tile['y']}, flip: {tile['flip']}")

def rotate_tiles(tiles, origin, angle_degrees):
    """
    Rotates all tiles around a given origin by a specified angle.

    Parameters:
        tiles (list): A list of dictionaries with tile data.
        origin (tuple): The (x, y) coordinates of the rotation origin.
        angle_degrees (float): The rotation angle in degrees.

    Returns:
        list: A list of rotated tile data.
    """
    # Convert the angle from degrees to radians
    angle = math.radians(angle_degrees)
    
    for tile in tiles:
        if any(ignore_string in tile["name"] for ignore_string in ignore_strings):
            continue
        x, y = rotate(origin, (tile["x"], tile["y"]), angle)
        x += 2000
        tile.update({"x": x, "y": y})
    
    return tiles

def write_tiles_to_file(tiles, file_path):
    """
    Writes the tile data to a specified file.

    Parameters:
        tiles (list): A list of dictionaries with tile data.
        file_path (str): Path to the output file.
    """
    with open(file_path, "w") as f:
        for tile in tiles:
            if tile['flip'] == "N":
                line = f"{tile['name']} {tile['x']} {tile['y']} W\n"
            else:
                line = f"{tile['name']} {tile['x']} {tile['y']} {tile['flip']}\n"
            f.write(line)

# Example usage
input_path = "macro_orig.cfg"  # Path to your input configuration file
origin = (150, 50)  # Rotation origin (x, y)
angle = 90  # Rotation angle in degrees

# Read the tiles from the input file
tiles = read_tiles(input_path)

# Print the original tiles
print("Original tiles:")
print_tiles(tiles)

# Rotate the tiles around the given origin
tiles = rotate_tiles(tiles, origin, angle)

# Print the rotated tiles
print("\nRotated tiles:")
print_tiles(tiles)

# Write the rotated tiles to the output file
output_path = "macro.cfg"
write_tiles_to_file(tiles, output_path)
