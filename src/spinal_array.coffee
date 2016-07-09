require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
) arguments...

#set point on location with default position, (0,0) and set location infomation
@set_point_coll = (col, row)->
   {num: i, x: 0, y: 0} for i in [0...row * col]

@get_spinal_data_coll = (pointColl, c, r)=>
   @each @cloneDeep(pointColl), (v, i, o)=>
      pre = o[i - 1] ? {x: -1, y: 0}
      isStartY = pre.y is pointColl[0].y
      isUpturnX = pre.x is c - 1
      if isStartY and pre.x < c - 1 then v.x = pre.x + 1
      else if isUpturnX and pre.y < r - 1
         v.x = pre.x
         v.y = pre.y + 1
      else if pre.x > pointColl[0].x
         v.x = pre.x - 1
         v.y = pre.y
      else
         v.x = pre.x
         v.y = pre.y - 1

@to_spinal_array = (spinalColl)->
#render the location-array and show console
@render_location_arr = ()->


