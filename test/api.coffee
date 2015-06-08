expect  = require('chai').expect
nconf   = require 'nconf'
request = require 'supertest'

app = require '../app'
agent = request.agent app

describe 'API endpoints', ->
  describe 'Assignments', ->
    it 'should create a new assignment'
    it 'should remove an assignment'
    it 'should modify an assignment'
  describe 'Requests', ->
    it 'should list current requests'
    it 'should list pending group requests'
    it 'should list in-progress sessions'
    it 'should list busy lab assistants'
