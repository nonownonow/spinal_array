require '../config'


describe 'spinal Array',->
   {set_point_col, get_spiner_data, render_collection} = require '../../src/spinal_array'
   describe 'set_point_coll(col, row)', ->
      it 'should be collection composited with object',->
         set_point_coll(5,6).should.be.an.Array().which.length(30)
         set_point_coll(5,4).should.be.an.Array().which.length(20)
      it "should have elements which has 'num' property", ->
         set_point_coll(5,4)[0].should.be.an.Object().with.property('num').which.is.eql(0)
         set_point_coll(5,4)[1].should.be.an.Object().with.property('num').which.is.eql(1)
         set_point_coll(5,4)[0].should.be.an.Object().with.property('x').which.is.eql(0)
         set_point_coll(5,4)[0].should.be.an.Object().with.property('y').which.is.eql(0)
