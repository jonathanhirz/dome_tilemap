import "graphics" for ImageData
import "math" for Math

//Tile - draw one tile from a spritesheet on screen
//spritesheet: tiles are 16x16 with 1px margin/buffer
//             48 tile wide

class Tile {
    construct new(x, y, tileid) {
    _x = x
    _y = y
    _tileid = tileid - 1
    
    _image = ImageData.load("images/colored-transparent.png")
    _tile_size = 16
    _tiles_wide = 49
    _fliph = 1
    _flipv = 1
    _angle = 0

    //here we read the higher bits on the tileid (GID from Tiled) to see if it is flipped [H/V/D], then clear all bits
    var flip_horizontal = tileid & 0x80000000 != 0
    var flip_vertical = tileid & 0x40000000 != 0
    var flip_diagonal = tileid & 0x20000000 != 0
    _tileid = _tileid & ~(0x80000000 | 0x40000000 | 0x20000000 | 0x10000000)

    //if any flags are flipped, we need to adjust the tile
    if(flip_diagonal) {
      _angle = 90
    }
    if(flip_horizontal) {
      _fliph = _fliph * -1
    }
    if(flip_vertical) {
      _flipv = _flipv * -1
    }

    //math to figure out where in the tilesheet our tile is, based on tileid
    _row = Math.floor(_tileid / _tiles_wide)
    _col = (_tileid) % _tiles_wide
  } //new

  init() { } //init
  update() { } //update
  
  draw() {
    _image.transform({
      "srcX": (_tile_size + 1) * _col, "srcY": (_tile_size + 1) * _row,
      "srcW": _tile_size, "srcH": _tile_size,
      "scaleX": _fliph, "scaleY": _flipv, "angle": _angle
    }).draw(_x, _y)
  } //draw

} //Tile