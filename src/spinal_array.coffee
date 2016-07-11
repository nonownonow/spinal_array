require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
   @$(@get_spinal_coll) col, row
   @to_2d_arr
   @render_2d_arr
) arguments...
@wow= ()=>
   console.log 'wow'
#set point on location with default position, (0,0) and set location infomation
@set_point_coll = (col, row)->
   {x: 0, y: 0, v: i} for i in [0...row * col]

@get_spinal_coll = (pointColl, col, row)=>
   [isDownturn,c,r] = [null, col, row]
   @each @cloneDeep(pointColl), (v, i, o)=>
      pre = o[i - 1] ? {x: -1, y: 0}
      isDownturn = true if pre.y is r - 1 and pre.x is c - 1
      if isDownturn and ((r - 1) - pre.y is r - 1 - 1)
         isDownturn = false
         c = c-1
         r = r-1
      if !isDownturn and pre.x < c - 1
         v.x = pre.x + 1
         v.y = pre.y
      else if !isDownturn and pre.y < r - 1
         v.x = pre.x
         v.y = pre.y + 1
      else if (c - 1) - pre.x < c - 1
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


