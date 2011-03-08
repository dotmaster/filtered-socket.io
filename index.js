//filteredClient (register/unregister/broadCast for Socket.io)
require('coffee-script')
module.exports = io = require('./node_modules/socket.io/')
module.exports.oldClient = io.Client;
module.exports.Filter = require('./filter')
var filteredClient = module.exports.filteredClient = require ('./filteredClient');
io.setClient(filteredClient);