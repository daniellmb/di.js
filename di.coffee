###*
@file 0.27 kb Dependency Injection Micro Library
@author Daniel Lamb <dlamb.open.source@gmail.com>
###

DI =
  # dependancies
  deps: {}

  # register dependancy
  add: (name, obj) ->
    throw "dep #{name} already set" if @deps[name] isnt `undefined`
    @deps[name] = obj
    return

# get dependancies
  get: (func) ->
    obj = new func
    func.apply obj, @resolve(func)
    obj

  # resolve deps
  resolve: (func) ->
    args = @args(func)
    i = args.length
    deps = []
    while i--
      dep = @deps[args[i]]
      throw "dep #{args[i]} not found" if dep is `undefined`
      deps.push dep
    deps

  # parse function arguments
  args: (func) ->
    func.toString().match(/^function\s*[^\(]*\(\s*([^\)]*)\)/m)[1].split(",")