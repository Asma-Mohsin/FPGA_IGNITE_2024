import math

ignore_strings = ["BlockRAM", "cvxif_pau", "data_mem"]

def rotate(origin, point, angle):
    ox, oy = origin
    px, py = point

    qx = ox + math.cos(angle) * (px - ox) - math.sin(angle) * (py - oy)
    qy = oy + math.sin(angle) * (px - ox) + math.cos(angle) * (py - oy)
    return qx, qy

def read_tiles(file_path):
    tiles = []
    with open(file_path, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if line.strip() and not line.startswith(" "):
                parts = line.strip().split()
                name = parts[0]
                x, y = map(float, parts[1:3])  
                flip = parts[3]
                tiles.append({'name': name, 'x': x, 'y': y, "flip": flip})
    return tiles

def print_tiles(tiles):
    for tile in tiles:
        print(f"TILE name: {tile['name']} x: {tile['x']}, y: {tile['y']}, flip: {tile['flip']}")

def rotate_tiles(tiles, origin, angle_degrees):
    angle = math.radians(angle_degrees)
    
    for tile in tiles:
        if any(ignore_string in tile["name"] for ignore_string in ignore_strings):
            continue
        x, y = rotate(origin, (tile["x"], tile["y"]), angle)
        tile.update({"x": int(round(x, 2)), "y": int(round(y, 2))}) 
    
    return tiles

def write_tiles_to_file(tiles, file_path):
    with open(file_path, "w") as f:
        for tile in tiles:
            line = f"{tile['name']} {tile['x']} {tile['y']} {tile['flip']}\n"
            f.write(line)


input_path = "macro_orig.cfg"  
origin = (1500, 1500)  
angle = 90 

tiles = read_tiles(input_path)

print("Original tiles:")
print_tiles(tiles)

tiles = rotate_tiles(tiles, origin, angle)

print("\nRotated tiles:")
print_tiles(tiles)

output_path = "macro.cfg"
write_tiles_to_file(tiles, output_path)
