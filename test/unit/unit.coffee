require '../config'


_ = require 'lodash'
{get_boundary} = require '../../src/spinal_array'
describe 'spinal Array',->
   {set_point_coll, get_spinal_data_coll, render_collection} = require '../../src/spinal_array'
   describe 'set_point_coll(col, row)', ->
      it 'should be collection object',->
         set_point_coll(5,4).should.is.an.Object()
      it "should have property,'point' which is array collection that each object element has 'num,x,y' property", ->
         set_point_coll(5,6).should.be.an.Array().which.length(30)
         set_point_coll(5,4).should.be.an.Array().which.length(20)
         set_point_coll(5,4)[0].should.be.an.Object().with.property('num').which.is.eql(0)
         set_point_coll(5,4)[1].should.be.an.Object().with.property('num').which.is.eql(1)
         set_point_coll(5,4)[0].should.be.an.Object().with.property('x').which.is.eql(0)
         set_point_coll(5,4)[0].should.be.an.Object().with.property('y').which.is.eql(0)
   describe 'get_spiner_data', ->
      [col, row] = [5, 4]
      coll_test = set_point_coll(col, row)
      boundary = get_boundary(col, row)

      context 'isClockwise is true', ->
         it "should increase x,'x-position' by flowing time until boundary.br 'bottom-rightn' ", ->
            get_spinal_data_coll(coll_test,true,col,row)[1]['x'].should.eql(1)
            get_spinal_data_coll(coll_test,true,col,row)[3]['x'].should.eql(3)
         it "should increase y,'y-position' by flowing time and stop increase x,'x-position' until boundary.tr 'top-right",->
            get_spinal_data_coll(coll_test,true,col,row)[boundary.br.x]['x'].should.eql(boundary.br.x-1)
            get_spinal_data_coll(coll_test,true,col,row)[boundary.br.x+1]['x'].should.eql(boundary.br.x-1)