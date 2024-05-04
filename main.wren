import "dome" for Process, Window
import "graphics" for Canvas, Color, ImageData
import "input" for Keyboard

import "class/Tilemap" for Tilemap

//Main - dome_tilemap

class Main {
  construct new() {}

  init() {
    Window.title = "dome_tilemap"
    var zoom = 2
    Canvas.resize(128 * zoom, 128 * zoom)
    Window.resize(640, 640)

    _tilemap = Tilemap.new(16 * 0, 16 * 0, "mudlands.json")

  } //init

  update() {
    if (Keyboard.isKeyDown("escape")) { Process.exit() } 

  } //update

  draw(dt) {
    Canvas.cls(Color.rgb(68, 38, 41))
    _tilemap.draw()

  } //draw

} //Main

var Game = Main.new()
