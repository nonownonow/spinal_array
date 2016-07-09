require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
) arguments...

#set point on location with default position, (0,0) and set location infomation
@set_point_coll = (col, row)->
   {num: i, x: 0, y: 0} for i in [0...row * col]

@get_step = (pos1, c, r) =>
   cycle = [c, r, c, r]
   (pos1.num) % (@sum(cycle) - cycle.length)

@get_process_status = (pos1, c, r)=>
   step = @get_step(pos1, c, r)
   if step < c - 1 then {x: 1, y: 0}
   else if step < c + r - 2 then {x: 0, y: 1}
   else if step < c + r + c - 3 then {x: -1, y: 0}
   else if step < c + r + c + r - 4 then {x: 0, y: -1}

@get_spinal_data_coll = (pointColl, c, r)=>
   @each @cloneDeep(pointColl), (v, i, o)=>
      pre = o[i - 1] ? {x: -1, y: 0, num: -1}
#      if @get_step(pre,c,r) is c+r+c+r-4
      status = @get_process_status(pre, c, r)
      @set v, 'x', pre.x + status.x
      @set v, 'y', pre.y + status.y


#   @map pointColl, (v,i)=>


@to_spinal_array = (spinalColl)->
#render the location-array and show console
@render_location_arr = ()->


