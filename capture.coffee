webshot = require 'webshot'
async = require 'async'

sites = null

for arg, count in process.argv
  if arg == '-c' and process.argv[count+1]?
    sites = require "./#{process.argv[count+1]}"

captureScreen = (site, width, height) ->
  console.log "Capturing::#{site.name}-#{width}x#{height}"
  options =
    screenSize:
      width: size.width
      height: size.height
    shotSize:
      width: size.width
      height: "all"

  webshot site.url, "screens/#{site.name}/#{size.width}x#{size.height}.png", options, (err)->
    if err then console.log err

jobs = []
if sites?
  for site in sites.data
    for size in site.sizes
        jobs.push do (size) ->
          captureScreen site, size.width, size.height

  async.parallel jobs
else
  console.log "No config file designated."