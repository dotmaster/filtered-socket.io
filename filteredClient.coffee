nodeBase = require 'nodeBase'
util = require(if process.binding('natives').util then 'util' else 'sys')
extend = nodeBase.extend
Filter = require './Filter'

log = -> filteredClient.log arguments...


class filteredClient extends io.Client
  @defaults: 
    logging:true
  nodeBase.static(@); #add static @options to class
  constructor:(opts) ->
    @defaults =
      put:'someDefaultsHere'
    #must call the constructor before mixing in nodeBase! (to reduce risk of potentially shallowing constructor functions of Client)
    super(arguments...)
    #nodeBase as a mixin
    @[i]=n[i] for i, val of n = new nodeBase(arguments...)
    
  #register a new filter  (must be called after connect event)        
  _register: (filter) =>
    filter = new Filter(filter)
    filters = client.filters or {}
    filters[filter.id] = filter
    @info "Client #{@sessionId}  registered for filtered messages", JSON.stringify filter
    @emit('register', client, filter)

  #unregister an existing filter      
  _unregister: (filter) =>
    filters = client.filters or []
    if typeof filter is 'number'
      f = filters[filter]
    else #if we are not searching for the filter by id make a deep traversal to find the filter
      if _.isEqual(_f.filter, filter) then f=_f; break for _f in filters
    if not f? 
      return @warn 'filter to remove was not in list of filters for client', JSON.stringify filter;
    delete filters[filter.id]
    @info "Client #{@sessionId}  unregistered for receiving messages from filter ", JSON.stringify filter
    @emit('unregister', client, filter)
    
  #send    
  send: (message) =>
    if @filter(message)
      super message
    else @log 'message #{message} filtered out from client #{@sessionId}', client, message

  filter: (message) =>  
    for filter in @filters
      if not filter.test(message) then return false
    return true
    
module.exports = filteredClient