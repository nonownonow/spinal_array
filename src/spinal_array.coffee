require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
   @$(@get_spinal_data) col, row
   @to_2d_arr
   @render_2d_arr
) arguments...

#set point on location with default position, (0,0) and set location infomation
@set_point_coll = (col, row)->
   {x: 0, y: 0, v: i} for i in [0...row * col]

@get_spinal_data = (pointColl, c, r)=>
   @each @cloneDeep(pointColl), (v, i, o)=>
      pre = o[i - 1] ? {x: -1, y: 0}
      isDownturnX = pre.y is r - 1
      isUpturnX = (r - 1) - pre.y is r - 1
      isUpturnY = pre.x is c - 1
      if isUpturnX and pre.x < c - 1
         v.x = pre.x + 1
         v.y = pre.y
      else if isUpturnY and pre.y < r - 1
         v.x = pre.x
         v.y = pre.y + 1
      else if isDownturnX and (c - 1) - pre.x < c - 1
         v.x = pre.x - 1
         v.y = pre.y
      else
         v.x = pre.x
         v.y = pre.y - 1

@to_2d_arr = (spinalColl)=>
   col = @max(@map spinalColl, 'x') + 1
   row = @max(@map spinalColl, 'y') + 1
   @reduce spinalColl, (r, v, i)=>
      @set r, "[#{v.y}][#{v.x}]", v.v
   , (@concat arr = [], [0...col] for [0...row])

@render_2d_arr = (arr)=>
   @each arr, (v)=>
      unless @isArray v then throw 'not Array!'
      console.log("#{@join v, ' '}")

