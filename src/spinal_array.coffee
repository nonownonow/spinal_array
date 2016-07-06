require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
) arguments...

#set point on location with default position, (0,0) and set location infomation
@set_point_coll = (col, row)->
   {num: i, x: 0, y: 0} for i in [0...row * col]

#c = col, r = row
@get_boundary = (c, r)->
   bl: {x: 0, y: 0} # bottom-left
   br: {x: c, y: 0} # bottom-right
   tr: {x: c, y: r} # top-right
   tl: {x: 0, y: r} # top-left

@get_increase_status = (pos1, pos2) ->
   x: if pos1.x - pos2.x > 0 then true else false
   y: if pos1.y - pos2.y > 0 then true else false
#get spiner data from the setted collection
@get_spinal_data_coll = (pointColl, isClockwise, col, row)=>
   boundary = @get_boundary(col, row);
   increase = {x: true, y: true}
   @each @cloneDeep(pointColl), (v, i, o)=>
      pre = o[i - 1] ? {x: -1, y: 0}
      if increase.x and pre.x + 1 < boundary.br.x
         @set(v, 'x', pre.x + 1)
      else if increase.y and pre.y + 1 < boundary.tr.y
         @set(v, 'x', pre.x)
         @set(v, 'y', pre.y + 1)
      else if pre.x - 1 > boundary.tl.x
         increase.x = false
         @set(v, 'x', pre.x - 1)
#      else if i
@get_process_status = (pos1, c, r)=>
   cycle = [c, r, c, r]
   len = (pos1.num + 1) % (@sum(cycle) - cycle.length)

   if len < c then {x: 1, y: 0}
   else if len < c + r - 1 then {x: 0, y: 1}
   else if len < c + r + c - 2 then {x: -1, y: 0}
   else {x: 0, y: -1}


@to_spinal_array = (spinalColl)->
#render the location-array and show console
@render_location_arr = ()->


