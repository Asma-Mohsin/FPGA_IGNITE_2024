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
    qy = oy + math.sin(angle) * (px - ox) + math.cos(angle) * (py - oy)
    return qx, qy


def read_tiles(file_path):
    """
    Reads the input file and extracts tile information into a list of dictionaries.

    Parameters:
        file_path (str): Path to the input file.

    Returns:
        list: A list of dictionaries with tile data (e.g., [{'x': value, 'y': value, ...}]).
    """
    tiles = []
    with open(file_path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if line.strip() and  not line.startswith(" "):
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

def rotate_tiles(tiles, origin, angle):
    for tile in tiles:
        if any(ignore_string in tile["name"] for ignore_string in ignore_strings):
            continue
        #x, y = rotate(origin, (tile["x"], tile["y"]), math.radians(angle))
        x, y = rotate(origin, (0, 10), math.radians(angle))
        #print(f"new: {int(x)}, {int(y)} old:{int(tile['x'])} {int(tile['y'])}")
        tile.update({"x": int(x)})
        tile.update({"y": int(y)})
    return tiles

def write_tiles_to_file(tiles, file_path):
    with open(file_path, "w") as f:
        for tile in tiles:
            line = f"{tile['name']} {tile['x']} {tile['y']} {tile['flip']}\n"
            f.write(line)

point = (3, 4)
origin = (0, 0)
print(rotate(origin, point, math.radians(90)))


# Example usage
input_path = "macro.cfg"  # Path to your input configuration file
angle = math.radians(90)  # Rotation angle in radians (90 degrees in this case)

file_path = "macro.cfg"
tiles = read_tiles(file_path)
#print_tiles(tiles)

tiles = rotate_tiles(tiles, origin, angle)

write_tiles_to_file(tiles, "rotated_macros.cfg")
