expect   = require('chai').expect
nconf    = require 'nconf'

thinky = require '../app/lib/db'
logger = require '../app/lib/logger'
helpers = require './helpers'

User = require '../app/models/user'


describe 'User models', ->
	# beforeEach (done) ->
	# 	helpers.clearDatabase done

	it 'should create a new user', ->
		# Create a new user and save it to the database
		benBitdiddle = User.build
			id: "12345"
			avatar: "http://www.foo.com/test.png"
			email: "foo@bar.com"
			language: "en"

			firstName: "Ben"
			lastName: "Bitdiddle"

		benBitdiddle.save()
		.then (doc) ->
			# Find the user we just saved
			User.findById "12345"
			.then (user) ->
				expect(user.id).to.equal "12345"
			.error (err) ->
				throw err

		.error (err) ->
			throw err

	it 'should authenticate user with Google OAuth2'

