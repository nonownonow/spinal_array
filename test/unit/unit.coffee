require '../config'
_ = require 'lodash'

describe 'spinal Array', ->
   {set_point_coll, get_spinal_data_coll, to_2d_arr, render_2d_arr} = require '../../src/spinal_array' # plan to test
   describe 'set_point_coll(col, row)', ->
      it 'should be collection object', ->
         set_point_coll(5, 4).should.is.an.Object()
      it "should have property,'point' which is array collection that each object element has 'num,x,y' property", ->
         set_point_coll(5, 6).should.be.an.Array().which.length(30)
         set_point_coll(5, 4).should.be.an.Array().which.length(20)
         set_point_coll(5, 4)[0].should.be.an.Object().with.property('v').which.is.eql(0)
         set_point_coll(5, 4)[1].should.be.an.Object().with.property('v').which.is.eql(1)
         set_point_coll(5, 4)[0].should.be.an.Object().with.property('x').which.is.eql(0)
         set_point_coll(5, 4)[0].should.be.an.Object().with.property('y').which.is.eql(0)
   describe 'get_spinner_data', ->
      [col, row] = [5, 4]
      point_coll = set_point_coll(col, row)
      console.log get_spinal_data(point_coll, col, row)
      it "should increase x 1point until point_coll's length is range from 0 to col", ->
         get_spinal_data(point_coll, col, row)[2].should.has.property('x', 2)
         get_spinal_data(point_coll, col, row)[2].should.has.property('y', 0)
         get_spinal_data(point_coll, col, row)[3].should.has.property('x', 3)
         get_spinal_data(point_coll, col, row)[3].should.has.property('y', 0)
      it "should increase y 1point until point_coll's length is range from col to col+row-1", ->
         get_spinal_data(point_coll, col, row)[col].should.has.property('y', 1)
         get_spinal_data(point_coll, col, row)[col].should.has.property('x', col - 1)
         get_spinal_data(point_coll, col, row)[col + 1].should.has.property('y', 2)
         get_spinal_data(point_coll, col, row)[col + 1].should.has.property('x', col - 1)
      it "should decrease x 1point until point_coll's length is range from col+row-1 to col+row+col-2", ->
         get_spinal_data(point_coll, col, row)[col + row - 1].should.has.property('x', 3)
         get_spinal_data(point_coll, col, row)[col + row - 1].should.has.property('y', row - 1)
         get_spinal_data(point_coll, col, row)[col + row].should.has.property('x', 2)
         get_spinal_data(point_coll, col, row)[col + row].should.has.property('y', row - 1)
      it "should decrease y 1point until point_coll's length is range from col+row+col-2 to col+row+col+row-3 ", ->
         get_spinal_data(point_coll, col, row)[col + row + col - 2].should.has.property('y', 2)
         get_spinal_data(point_coll, col, row)[col + row + col - 2].should.has.property('x', 0)
         get_spinal_data(point_coll, col, row)[col + row + col - 1].should.has.property('y', 1)
         get_spinal_data(point_coll, col, row)[col + row + col - 1].should.has.property('x', 0)
      it "should decrease y 1point until point_coll's length is range from col+row+col+row-4 to col+row+col+row-4+col", ->
         get_spinal_data(point_coll, col, row)[col + row + col + row - 4].should.has.property('x', 0)
         get_spinal_data(point_coll, col, row)[col + row + col + row - 4].should.has.property('y', 0)
         get_spinal_data(point_coll, col, row)[col + row + col + row - 3].should.has.property('x', 1)
         get_spinal_data(point_coll, col, row)[col + row + col + row - 3].should.has.property('y', 0)
   describe 'to_spinal_array', ->
      [col, row] = [5, 4]
      spinalColl = get_spinal_data set_point_coll(col, row), col, row

      it "should array.length is col, and array[0].length is row", ->
         to_2d_arr(spinalColl).should.be.a.Array().which.match
            '0':(it)-> it.should.be.a.Array().containDeepOrdered([14,15,17])
            '1':(it)-> it.should.be.a.Array().containDeepOrdered([13,1,2])
            '2':(it)-> it.should.be.a.Array().containDeepOrdered([12,1,2])
            '3':(it)-> it.should.be.a.Array().containDeepOrdered([11,10,9])
   describe 'render_2d_arr', ->
      [col, row] = [5, 4]
      render_2d_arr to_2d_arr get_spinal_data set_point_coll(col, row), col, row
