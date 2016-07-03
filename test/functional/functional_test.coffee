require '../config'

describe 'spinal_array(x,y)',->
   {spinal_array} = require '../../src/spinal_array'
   it 'should return Array which length is x*y',->
      spinal_array(6,5).should.be.an.Array().which.length(30)
      spinal_array(6,6).should.be.an.Array().which.length(36)
#      spinal_array(6,5)[0].should.be.an.Array().which.length(5)
#      spinal_array(6,6)[0].should.be.an.Array().which.length(6)

