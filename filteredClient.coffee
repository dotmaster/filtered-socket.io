nodeBase = require 'nodeBase'
util = require(if process.binding('natives').util then 'util' else 'sys')
Client = require('./node_modules/socket.io/').Client
extend = nodeBase.extend

log = -> filteredClient.log arguments...


class filteredClient extends Client
  @defaults: 
    logging:true
  nodeBase.static(@); #add static @options to class
  constructor:(opts) ->
    @defaults =
      put:'someDefaultsHere'
    #super(arguments...)
    #nodeBase as a mixin
    extend(@, new nodeBase(arguments...))
    @error 'awesome!!!'
  register: => 
    @log 'hello there'
    @warn 'hello there'
  
myObj = new filteredClient 
  logging: true
  logLevel: 'WARN'
  some:'opts',
myObj.someMember() 


module.exports = filteredClient