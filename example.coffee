# logger interface
Logger = log: (msg) ->

# simple interface implementation
SimpleLogger = ->
SimpleLogger:: = Object.create(Logger)
SimpleLogger::log = (msg) ->
  console.log msg

# fancy interface implementation
FancyLogger = ->
FancyLogger:: = Object.create(Logger)
FancyLogger::log = (msg) ->
  console.log new Date() + ": #{msg}"

# cart depends on logger
ShoppingCart = (logger) ->
  @logger = logger
ShoppingCart::add = (item) ->
  @logger.log "Item ##{item.id} added to the cart!"

# wire-up the logger to use
#DI.add "logger", new SimpleLogger()
DI.add "logger", new FancyLogger()

# create cart and use it
cart = DI.get ShoppingCart
cart.add id: 1337