class Filter extends (require 'nodeBase' )
  #.filter({ price: {
  #                   lessthan:10
  #                 },
  #          type: "Book"})  
  constructor: (filter, opts) ->
    super(opts)
    @id = Filter.uuid()
    @filter = filter
  test: (message) =>
    for attr, val of @filter
      if typeof val is "object"  
        for predicate, val of val
          if not _test predicate, val, message[attr] then return false
      else if not message[attr] is value then return false
    return true
      
_test = (predicate, value, message) ->
  switch short predicate
    when "regex" then message.test(value)
    when "lt","<" then message < value
    when "gt", ">" then message > value
    when "lte", "<=" then message <= value
    when "gte", ">=" then message >= value
    when "starts" then message.indexOf(value) is 0
    when "ends" then message.substring((message.length - value.length)) is value
    when "like" then message.indexOf(value) >= 0
    when "is" then message is value
    else @warn 'predicate #{predicate} unknown', predicate

short = (name) ->
  filterMapping[name]?=name

filterMapping =
  'lesserthan':'lt'
  'greaterthan':'gt'
  'startswith':'starts'  
  'endswith':'ends'        