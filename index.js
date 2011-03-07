//filteredClient (register/unregister/broadCast for Socket.io)
require('coffee-script')
module.exports = io = require('./node_modules/socket.io/')
var filteredClient = module.exports.filteredClient = require ('./filteredClient');
io.setClient(filteredClient);