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
   describe 'get_spiner_data', ->
      [col, row] = [5, 4]
      coll_test = set_point_coll(col, row)
      boundary = get_boundary(col, row)
      context 'isClockwise is true', ->
         it "should increase x,'x-position' by flowing time until boundary.br 'bottom-rightn' ", ->
            get_spinal_data_coll(coll_test, true, col, row)[1]['x'].should.eql(1)
            get_spinal_data_coll(coll_test, true, col, row)[3]['x'].should.eql(3)
         it "should increase y,'y-position' by flowing time and stop increase x,'x-position' until boundary.tr 'top-right", ->
            get_spinal_data_coll(coll_test, true, col, row)[5]['x'].should.eql(boundary.br.x - 1)
            res = get_spinal_data_coll(coll_test, true, col, row)
            it "should decrease x,'y-position' by flowing time and stop increase y,'y-position' until boundary.tl 'top-left", ->
               get_spinal_data_coll(coll_test, true, col, row)[8]['x'].should.eql(3)
               get_spinal_data_coll(coll_test, true, col, row)[9]['x'].should.eql(2)
               get_spinal_data_coll(coll_test, true, col, row)[boundary.br.x + 1]['x'].should.eql(boundary.br.x - 1)
            it "should decrease y,'y-position' by flowing time and stop decrease x,'x-position' until boundary.bl 'bottom-left", ->
            it "should decrease x, and stop increase y by flowing time", ->
               get_spinal_data_coll(coll_test, true)[col + row + 1]['y'].should.eql(row)
               get_spinal_data_coll(coll_test, true)[col + row + 1]['x'].should.eql(col)
               get_spinal_data_coll(coll_test, true)[col + row + 2]['y'].should.eql(row)
               get_spinal_data_coll(coll_test, true)[col + row + 2]['x'].should.eql(col - 1)
            it "should decrease y, and stop decrease x by flowing time", ->

#      describe "if predicted y equal boudary.tr.y, status is {x:-1, y:0}"
#      describe "if predicted x equal boudary.tl.x, status is {x:0, y:-1}"
#
#
#   describe 'render_collection', ->