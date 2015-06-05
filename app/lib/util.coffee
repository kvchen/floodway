url = require 'url'

stripAvatarSize = (avatarURL) ->
	parts = url.parse avatarURL, true
	parts.query = null
	parts.search = null

	return url.format parts


module.exports.stripAvatarSize = stripAvatarSize
