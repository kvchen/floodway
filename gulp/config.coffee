dest = './app/public/build'
src = './app/public/src'

module.exports =
  lint:
    src: ['./app/**/*.coffee', '!./app/config/*']
