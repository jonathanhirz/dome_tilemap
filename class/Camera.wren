import "graphics" for Canvas
import "math" for Vector

//Camera - follows an Entity and moves the Canvas offset accordingly
// add lerp

class Camera {
  construct new() {  
    _entity = null
  } //new

  entity {_entity}
  entity=(v) {_entity = v}

  init() { } //init

  update() {
    if(_entity != null) {
      Canvas.offset = Vector.new(-_entity.x + Canvas.width/2, -_entity.y + Canvas.height/2)
    }
    
  } //update

  draw() { } //draw

} //Camera