require 'at-lodash'

@spinal_array = (
   col, row
   startValue = 0
   boundarys = @get_boundarys(col, row)
   directionAi = @get_directionAi [{x: 1, y: 0}, {x: 0, y: 1}, {x: -1, y: 0}, {x: 0, y: -1}]
)=>@flow(
   @set_2d_coll
   => @get_spinal_coll arguments..., col, row, startValue, boundarys, directionAi
   @to_2d_arr
) arguments...

@get_boundarys = (c, r)=> [{x:c, y: 0}, {x: c-1, y: r}, {x: -1, y: r-1}]

@get_directionAi = (directions, i = 0)=> loop yield directions[i++ % directions.length]

#setting space
@set_2d_coll = (col, row)=> {
   x: i % col
   y: @floor i / col
   v: null
} for i in [0...row * col]

@get_spinal_coll = (pointColl, col, row, startValue, boundarys, directionAi)=>
   boundary = @map boundarys, @SS(@set, 'v', undefined)
   pointColl = @concat pointColl, boundary
   {value} = directionAi.next()
   #setting time and setting current position by past position
   (@each pointColl, (v, i, o)=>
      return false if i is pointColl.length - boundary.length
      pre = o[i - 1] ? {x: -1, y: 0, v: startValue - 1}
      (findDirection = ()=>
         check = x: pre.x + value.x, y: pre.y + value.y
         cur = @find(o, {x: check.x, y: check.y})
         #when crash, change the direction
         if !cur or cur.v is null
            @set v, 'x', check.x
            @set v, 'y', check.y
            @set v, 'v', pre.v + 1
         else
            findDirection value = directionAi.next().value)(value)
   )[...-boundary.length]

#transform collection to array
@to_2d_arr = (spinalColl)=>
   col = @max(@map spinalColl, 'x') + 1
   row = @max(@map spinalColl, 'y') + 1
   @reduce spinalColl, (r, v, i)=>
      @set r, "[#{v.y}][#{v.x}]", v.v
   , (@concat arr = [], [0...col] for [0...row])




