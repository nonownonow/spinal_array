require 'should'
describe 'spinal_array(x,y)', ->
   {spinal_array} = require '../../src/spinal_array'
   res = spinal_array(13,7)
   it 'should return Array which length is x*y', ->
      res.should.be.an.Array().which.match
         '0': (it)-> it.should.be.a.Array().containDeepOrdered([0,12])
         '1': (it)-> it.should.be.a.Array().containDeepOrdered([35, 13])
         '2': (it)-> it.should.be.a.Array().containDeepOrdered([34, 14])
         '3': (it)-> it.should.be.a.Array().containDeepOrdered([33, 15])
         '4': (it)-> it.should.be.a.Array().containDeepOrdered([32, 16])
         '5': (it)-> it.should.be.a.Array().containDeepOrdered([31, 17])
         '6': (it)-> it.should.be.a.Array().containDeepOrdered([30, 18])
