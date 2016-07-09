require '../config'
_ = require 'lodash'

describe 'spinal Array', ->
   {get_boundary} = require '../../src/spinal_array' # not plan to test
   {set_point_coll, get_spinal_data_coll, get_process_status} = require '../../src/spinal_array' # plan to test
   describe 'set_point_coll(col, row)', ->
      it 'should be collection object', ->
         set_point_coll(5, 4).should.is.an.Object()
      it "should have property,'point' which is array collection that each object element has 'num,x,y' property", ->
         set_point_coll(5, 6).should.be.an.Array().which.length(30)
         set_point_coll(5, 4).should.be.an.Array().which.length(20)
         set_point_coll(5, 4)[0].should.be.an.Object().with.property('num').which.is.eql(0)
         set_point_coll(5, 4)[1].should.be.an.Object().with.property('num').which.is.eql(1)
         set_point_coll(5, 4)[0].should.be.an.Object().with.property('x').which.is.eql(0)
         set_point_coll(5, 4)[0].should.be.an.Object().with.property('y').which.is.eql(0)
   describe 'get_spinner_data', ->
      [col, row] = [5, 4]
      point_coll = set_point_coll(col, row)
      console.log get_spinal_data_coll(point_coll,col,row)
      it "should increase x 1point until point_coll's length is range from 0 to col", ->
         get_spinal_data_coll(point_coll, col, row)[2].should.has.property('x',2)
         get_spinal_data_coll(point_coll, col, row)[2].should.has.property('y',0)
         get_spinal_data_coll(point_coll, col, row)[3].should.has.property('x',3)
         get_spinal_data_coll(point_coll, col, row)[3].should.has.property('y',0)
      it "should increase y 1point until point_coll's length is range from col to col+row-1", ->
         get_spinal_data_coll(point_coll, col, row)[col].should.has.property('y',1)
         get_spinal_data_coll(point_coll, col, row)[col].should.has.property('x',col-1)
         get_spinal_data_coll(point_coll, col, row)[col+1].should.has.property('y',2)
         get_spinal_data_coll(point_coll, col, row)[col+1].should.has.property('x', col-1)
      it "should decrease x 1point until point_coll's length is range from col+row-1 to col+row+col-2", ->
         get_spinal_data_coll(point_coll, col, row)[col+row-1].should.has.property('x',3)
         get_spinal_data_coll(point_coll, col, row)[col+row-1].should.has.property('y',row-1)
         get_spinal_data_coll(point_coll, col, row)[col+row].should.has.property('x',2)
         get_spinal_data_coll(point_coll, col, row)[col+row].should.has.property('y',row-1)
      it "should decrease y 1point until point_coll's length is range from col+row+col-2 to col+row+col+row-3 ", ->
         get_spinal_data_coll(point_coll, col, row)[col+row+col-2].should.has.property('y',2)
         get_spinal_data_coll(point_coll, col, row)[col+row+col-2].should.has.property('x',0)
         get_spinal_data_coll(point_coll, col, row)[col+row+col-1].should.has.property('y',1)
         get_spinal_data_coll(point_coll, col, row)[col+row+col-1].should.has.property('x',0)
      it "should decrease y 1point until point_coll's length is range from col+row+col+row-4 to col+row+col+row-4+col", ->
         get_spinal_data_coll(point_coll, col, row)[col+row+col+row-4].should.has.property('x',0)
         get_spinal_data_coll(point_coll, col, row)[col+row+col+row-4].should.has.property('y',0)
         get_spinal_data_coll(point_coll, col, row)[col+row+col+row-3].should.has.property('x',1)
         get_spinal_data_coll(point_coll, col, row)[col+row+col+row-3].should.has.property('y',0)
   describe "get_process_status", ->
      [col,row] = [5, 4]
      pointColl = set_point_coll(col, row)
      it "default status is {x:1, y:0}", ->
         get_process_status(pointColl[0], col, row).should.has.keys('x', 'y')
         get_process_status(pointColl[0], col, row).should.has.property('x', 1)
      it "Wheb pointColl[col]'s length equal col-1, status value change {x:0, y:1}", ->
         get_process_status(pointColl[col - 1], col, row).should.has.property('y', 1)
      it "When pointColl[col]'s length equal col+row-2, status change {x:-1, y:0}", ->
         get_process_status(pointColl[col + row - 2], col, row).should.has.property('x', -1)
      it "if pointColl[col]'s length equal col+row+col-3, status change {x:0, y:-1}", ->
         get_process_status(pointColl[col + row + col - 3], col, row).should.has.property('y', -1)
      it "if pointColl[col]'s length is equal col+row+col+row-4, status change {x:0, y:-1}", ->
         get_process_status(pointColl[col + row + col + row - 4], col, row).should.has.property('x', 1)

#      describe "if predicted y equal boudary.tr.y, status is {x:-1, y:0}"
#      describe "if predicted x equal boudary.tl.x, status is {x:0, y:-1}"
#
#
#   describe 'render_collection', ->