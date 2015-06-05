expect		= require('chai').expect
nconf		= require 'nconf'
request		= require 'supertest'

app	= require '../app'
agent = request.agent app

describe 'API endpoints', ->
	it 'should list current requests'
	it 'should list busy lab assistants'
	it 'should list pending group requests'
	it 'should list in-progress sessions'


