require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_2d_coll
   @$(@get_spinal_coll) col, row
   @to_2d_arr
   @render_2d_arr
) arguments...

@rule_boundary = (c, r, start)=>
   [{x: start.x + c, y: start.y}, {x: start.x + c - 1, y: start.y + r}, {x: start.x - 1, y: start.y + r - 1}]
@rule_direction = (directions, i = 0)=>
   loop yield directions[i++ % directions.length]

@set_2d_coll = (
   col, row,
)=>
   res = ( {x: i % col, y: @floor(i / col), v: null} for i in [0...row * col] )


@get_spinal_coll = (
   pointColl, col, row
)=>
   startPoint = {x: 0, y: 0}
   boundary = @map @rule_boundary(col, row, startPoint), @SS(@set, 'v', undefined)
   pointColl = @concat pointColl, boundary
   startValue = 0
   direction = [{x: 1, y: 0}, {x: 0, y: 1}, {x: -1, y: 0}, {x: 0, y: -1}]
   directionItr = @rule_direction(direction)
   {value} = directionItr.next()
   res = @each pointColl, (v, i, o)=>
      return false if i is pointColl.length - boundary.length
      pre = o[i - 1] ? {x: -1, y: 0, v: startValue - 1}
      findDir = ()=>
         check = x: pre.x + value.x, y: pre.y + value.y
         cur = @find(o, {x: check.x, y: check.y})
         if !cur or cur.v is null
            @set v, 'x', check.x
            @set v, 'y', check.y
            @set v, 'v', pre.v + 1
         else
            findDir value = directionItr.next().value
      findDir(value)
   res[...-boundary.length]

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


