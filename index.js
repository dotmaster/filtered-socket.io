//filteredClient (register/unregister/broadCast for Socket.io)
if (new RegExp('v(\\d)\.(\\d)\.(\\d)').exec(process.version)[2]<4) require(__dirname + "/setup").ext('node_modules');
require('coffee-script')
var io = module.exports = require('socket.io/')
module.exports.oldClient = io.Client;
module.exports.Filter = require('./lib/filter')
var filteredListener = module.exports.filteredListener = require ('./lib/filteredListener');