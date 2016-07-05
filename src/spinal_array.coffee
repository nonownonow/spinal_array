require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
) arguments...

#set point on location with default position, (0,0) and set location infomation
@set_point_coll = (col, row)->
   {num: i, x: 0, y: 0} for i in [0...row * col]

#c = col, r = row
@get_boundary = (c, r)->
   br: {x:c, y:0} # bottom-right
   tr: {x:c, y:r} # top-right
   tl: {x:0, y:r} # top-left
   bl: {x:0, y:0} # bottom-left

#get spiner data from the setted collection
@get_spinal_data_coll = (pointColl, isClockwise, col, row)=>
   boundary = @get_boundary(col, row);
   @map pointColl, (v, i, o)=>
      pre = o[i - 1] ? {x:-1, y:0}
      if pre.x+1 < boundary.br.x
         @set(v, 'x', pre.x+1)
      else if pre.y+1 < boundary.tr.y
         @set(v, 'x', pre.x)
         @set(v, 'y', pre.y+1)
#      else if i

@to_spinal_array = (spinalColl)->
#render the location-array and show console
@render_location_arr = ()->


