# DI.js

0.27 kb Dependency Injection Micro Library

## Example

Run [live example](http://jsfiddle.net/daniellmb/yLrdA/2/)

```CoffeeScript
# logger interface
Logger = log: (msg) ->

# interface implementation
SimpleLogger = ->
SimpleLogger:: = Object.create(Logger)
SimpleLogger::log = (msg) ->
  console.log msg
  return

# interface implementation
FancyLogger = ->
FancyLogger:: = Object.create(Logger)
FancyLogger::log = (msg) ->
  console.log new Date().toString("dd/MM/yyyy HH:mm:ss fff") + ": #{msg}"

# cart depends on logger
ShoppingCart = (logger) ->
  @logger = logger
ShoppingCart::add = (item) ->
  @logger.log "Item ##{item.id} added to the cart!"

# wireup logger
#DI.add "logger", new SimpleLogger()
DI.add "logger", new FancyLogger()

# create cart and use it
cart = DI.get(ShoppingCart)
cart.add id: 1337
```