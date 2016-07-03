require 'at-lodash'

@spinal_array = (col, row)=> @flow(
   @set_point_coll
) arguments...
#set point on location with default position, (0,0)
@set_point_coll = (col, row)->
   {num: i, x: 0, y: 0} for i in [0...row * col]

#get spiner data from the setted collection
@get_spinal_data_coll = (coll)->

@to_spinal_array = (spinalColl)->
#render the location-array and show console
@render_location_arr = ()->


