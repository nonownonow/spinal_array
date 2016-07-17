{spinal_array}=require './index.js'
_= require 'lodash'

@spinal_array_run = => _.flow(
   spinal_array
   @render_2d_arr
) arguments...


@render_2d_arr = (arr)=>
   _.each arr, (v)=>
      unless _.isArray v then throw 'not Array!'
      console.log("#{_.join v, ' '}")

@spinal_array_run(
   Number(process.argv[2]), Number(process.argv[3])
) if process.argv[2]?
