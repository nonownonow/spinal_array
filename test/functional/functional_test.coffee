require '../config'

describe 'spinal_array(x,y)', ->
   {set_point_coll, get_spinal_data_coll, to_2d_arr, render_2d_arr} = require '../../src/spinal_array' # plan to test
   {spinal_array} = require '../../src/spinal_array'
   it 'should return Array which length is x*y', ->
      spinal_array(13, 7).should.be.an.Array().which.match
         '0': (it)-> it.should.be.a.Array().containDeepOrdered([72, 84])
         '1': (it)-> it.should.be.a.Array().containDeepOrdered([71, 85])
         '2': (it)-> it.should.be.a.Array().containDeepOrdered([70, 86])
         '3': (it)-> it.should.be.a.Array().containDeepOrdered([69, 87])
      spinal_array(5, 4).should.be.a.Array().which.match
         '0': (it)-> it.should.be.a.Array().containDeepOrdered([14, 15, 17])
         '1': (it)-> it.should.be.a.Array().containDeepOrdered([13, 1, 2])
         '2': (it)-> it.should.be.a.Array().containDeepOrdered([12, 1, 2])
         '3': (it)-> it.should.be.a.Array().containDeepOrdered([11, 10, 9])
#      spinal_array(6,6).should.be.an.Array().which.length(36)
#      spinal_array(6,5)[0].should.be.an.Array().which.length(5)
#      spinal_array(6,6)[0].should.be.an.Array().which.length(6)

