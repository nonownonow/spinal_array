require '../config'
_ = require 'lodash'

describe 'spinal Array', ->
   {set_2d_coll, get_spinal_coll, spinal_array} = require '../../src/spinal_array' # plan to test
   {get_directionAi, get_boundarys} = require '../../src/spinal_array' # plan to test
   describe 'set_2d_coll(col, row)', ->
      it "should have property,'point' which is array collection that each object element has 'num,x,y' property", ->
         set_2d_coll(2, 3)[3].should.be.an.Object().with.property('x').which.is.eql(1)
         set_2d_coll(2, 3)[3].should.be.an.Object().with.property('y').which.is.eql(1)
         set_2d_coll(2, 3)[4].should.be.an.Object().with.property('x').which.is.eql(0)
         set_2d_coll(2, 3)[4].should.be.an.Object().with.property('y').which.is.eql(2)
         set_2d_coll(2, 3)[6..9].forEach (v)-> v.should.match (it)-> it.should.match({v: undefined})

         set_2d_coll(5, 6)[6].should.be.an.Object().with.property('x').which.is.eql(1)
         set_2d_coll(5, 6)[6].should.be.an.Object().with.property('y').which.is.eql(1)
         set_2d_coll(5, 6)[13].should.be.an.Object().with.property('x').which.is.eql(3)
         set_2d_coll(5, 6)[13].should.be.an.Object().with.property('y').which.is.eql(2)
         res = set_2d_coll(5, 6)
         set_2d_coll(5, 6)[30..33].forEach (v)-> v.should.match (it)-> it.should.match({v: undefined})
   describe 'get_boundarys', ->
      boundary = get_boundarys(5, 6, {x: 0, y: 0})
      it "should be a Array", ->
         boundary.should.be.an.Array().with.length(3)
         boundary[0].should.match({x: 5, y: 0})
         boundary[2].should.match({x: -1, y: 5})
   describe 'roll_direction', ->
      directionItr = get_directionAi([{x: 1, y: 0}, {x: 0, y: 1}, {x: -1, y: 0}, {x: 0, y: -1}])
      it 'should be a generater', ->
         directionItr.should.be.a.iterator()
         directionItr.next().should.be.a.type('object').which.match(done: false, value: (it)-> it.should.match(x: 1, y: 0))
         directionItr.next().should.be.a.type('object').which.match(done: false, value: (it)-> it.should.match(x: 0, y: 1))
   describe 'get_spinner_coll', ->
      context '5*4 space', ->
         [col, row] = [5, 4]
         point_coll = set_2d_coll(col, row)
         spinal_coll = get_spinal_coll(point_coll,col,row)
         it "should have property spinal array's location", ->
            spinal_coll[2].should.match(x: 2, y: 0)
            spinal_coll[4].should.match(x: 4, y: 0)
            spinal_coll[5].should.match(x: 4, y: 1)
            spinal_coll[6].should.match(x: 4, y: 2)
            spinal_coll[7].should.match(x: 4, y: 3)
            spinal_coll[8].should.match(x: 3, y: 3)
            spinal_coll[9].should.match(x: 2, y: 3)
            spinal_coll[10].should.match(x: 1, y: 3)
            spinal_coll[11].should.match(x: 0, y: 3)
            spinal_coll[12].should.match(x: 0, y: 2)
            spinal_coll[13].should.match(x: 0, y: 1)
            spinal_coll[14].should.match(x: 1, y: 1)
            spinal_coll[15].should.match(x: 2, y: 1)
            spinal_coll[16].should.match(x: 3, y: 1)
            spinal_coll[17].should.match(x: 3, y: 2)
            spinal_coll[18].should.match(x: 2, y: 2)
            spinal_coll[19].should.match(x: 1, y: 2)
      context '3,4 space', ->
         [col, row] = [3, 4]
         point_coll = set_2d_coll(col, row)
         spinal_coll = get_spinal_coll(point_coll,col,row)
         it "should have property spinal array's location", ->
            spinal_coll[4].should.match(x: 2, y: 2)
            spinal_coll[7].should.match(x: 0, y: 3)
            spinal_coll[10].should.match(x: 1, y: 1)
            spinal_coll[11].should.match(x: 1, y: 2)
