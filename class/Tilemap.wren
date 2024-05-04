import "io" for FileSystem
import "json" for Json
import "math" for Math

import "class/Tile" for Tile

//Tilemap - class reads the Tiled data file, creates Tile objects and places them 

class Tilemap {
  construct new(x, y, filename) {
    _x = x
    _y = y
    _filename = filename

    _tile_count = 0
    _tiles = []

    //json - load the file, dig down to the map data
    //later, can grab the collision layer here too
    var json_file = Json.load(filename)
    var map = json_file["layers"]
    var map_data = map[0]["data"]
    var w = map[0]["width"]
    var h = map[0]["height"]

    //read through the map_data array, and draw the tile at the approprite spot
    //array index (_tile_count) will be used to calculate the x/y position
    //array entry is tile id (figured out in the Tile class)
    //also need to calculate the tile rotation/bit flipping thing
    for (tileid in map_data) {
      var tile_x = _tile_count % w
      var tile_y = Math.floor(_tile_count / w)

      var tile = Tile.new(tile_x * 16 + _x, tile_y * 16 + _y, tileid)
      _tiles.add(tile)
      _tile_count = _tile_count + 1
    }

  } //new

  init() { } //init
  update() { } //update

  draw() {
    for(tile in _tiles) {
      tile.draw()
    }
   } //draw

} //Tilemap