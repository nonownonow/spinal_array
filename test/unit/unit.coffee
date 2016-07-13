require '../config'
_ = require 'lodash'

describe 'spinal Array', ->
   {set_2d_coll, get_spinal_coll, to_2d_arr, render_2d_arr} = require '../../src/spinal_array' # plan to test
   describe.only 'set_2d_coll(col, row)', ->
      it "should have property,'point' which is array collection that each object element has 'num,x,y' property", ->
         set_2d_coll(2, 3).should.be.an.Array().which.length(6)
         set_2d_coll(2, 3)[3].should.be.an.Object().with.property('x').which.is.eql(1)
         set_2d_coll(2, 3)[3].should.be.an.Object().with.property('y').which.is.eql(1)
         set_2d_coll(2, 3)[4].should.be.an.Object().with.property('x').which.is.eql(0)
         set_2d_coll(2, 3)[4].should.be.an.Object().with.property('y').which.is.eql(2)

         set_2d_coll(5, 6).should.be.an.Array().which.length(30)
         set_2d_coll(5, 6)[6].should.be.an.Object().with.property('x').which.is.eql(1)
         set_2d_coll(5, 6)[6].should.be.an.Object().with.property('y').which.is.eql(1)
         set_2d_coll(5, 6)[13].should.be.an.Object().with.property('x').which.is.eql(3)
         set_2d_coll(5, 6)[13].should.be.an.Object().with.property('y').which.is.eql(2)
   describe 'get_spinner_data', ->
      [col, row] = [5, 4]
      point_coll = set_2d_coll(col, row)
#      console.log get_spinal_coll(point_coll, col, row)
      it "should increase x 1point until point_coll's length is range from 0 to col", ->
         get_spinal_coll(point_coll, col, row)[2].should.has.property('x', 2)
         get_spinal_coll(point_coll, col, row)[2].should.has.property('y', 0)
         get_spinal_coll(point_coll, col, row)[3].should.has.property('x', 3)
         get_spinal_coll(point_coll, col, row)[3].should.has.property('y', 0)
      it "should increase y 1point until point_coll's length is range from col to col+row-1", ->
         get_spinal_coll(point_coll, col, row)[col].should.has.property('y', 1)
         get_spinal_coll(point_coll, col, row)[col].should.has.property('x', col - 1)
         get_spinal_coll(point_coll, col, row)[col + 1].should.has.property('y', 2)
         get_spinal_coll(point_coll, col, row)[col + 1].should.has.property('x', col - 1)
      it "should decrease x 1point until point_coll's length is range from col+row-1 to col+row+col-2", ->
         get_spinal_coll(point_coll, col, row)[col + row - 1].should.has.property('x', 3)
         get_spinal_coll(point_coll, col, row)[col + row - 1].should.has.property('y', row - 1)
         get_spinal_coll(point_coll, col, row)[col + row].should.has.property('x', 2)
         get_spinal_coll(point_coll, col, row)[col + row].should.has.property('y', row - 1)
      it "should decrease y 1point until point_coll's length is range from col+row+col-2 to col+row+col+row-3 ", ->
         get_spinal_coll(point_coll, col, row)[col + row + col - 2].should.has.property('y', 2)
         get_spinal_coll(point_coll, col, row)[col + row + col - 2].should.has.property('x', 0)
         get_spinal_coll(point_coll, col, row)[col + row + col - 1].should.has.property('y', 1)
         get_spinal_coll(point_coll, col, row)[col + row + col - 1].should.has.property('x', 0)
      it "should decrease y 1point until point_coll's length is range from col+row+col+row-4 to col+row+col+row-4+col", ->
         get_spinal_coll(point_coll, col, row)[col + row + col + row - 4].should.has.property('x', 1)
         get_spinal_coll(point_coll, col, row)[col + row + col + row - 4].should.has.property('y', 1)
         get_spinal_coll(point_coll, col, row)[col + row + col + row - 3].should.has.property('x', 2)
         get_spinal_coll(point_coll, col, row)[col + row + col + row - 3].should.has.property('y', 1)
   describe 'to_spinal_array', ->
      [col, row] = [5, 4]
      spinalColl = get_spinal_coll set_2d_coll(col, row), col, row

      it "should array.length is col, and array[0].length is row", ->
         to_2d_arr(spinalColl).should.be.a.Array().which.match
            '0':(it)-> it.should.be.a.Array().containDeepOrdered([0,1,2])
            '1':(it)-> it.should.be.a.Array().containDeepOrdered([13,14,15])
            '2':(it)-> it.should.be.a.Array().containDeepOrdered([12,19,18])
            '3':(it)-> it.should.be.a.Array().containDeepOrdered([11,10,9])
   describe 'render_2d_arr', ->
      [col, row] = [5, 4]
      render_2d_arr to_2d_arr get_spinal_coll set_2d_coll(col, row), col, row
