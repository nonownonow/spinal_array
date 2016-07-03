require '../config'

describe 'spinal_array(x,y)',->
   {spinal_array} = require '../../src/spinal_array'
   it 'should return Array which length is x*y',->
      spinal_array(6,5).should.be.an.Array().which.length(5)
      spinal_array(6,6).should.be.an.Array().which.length(6)
