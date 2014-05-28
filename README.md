# DI.js

0.27 kb Dependency Injection Micro Library

## Example

Run [live example](http://jsfiddle.net/daniellmb/62J3F/)

```CoffeeScript
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
```

## License 

(The MIT License)

Copyright (c) 2014 Daniel Lamb <daniellmb.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
