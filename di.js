/**
 * @file 0.27 kb Dependency Injection Micro Library
 * @author Daniel Lamb <dlamb.open.source@gmail.com>
 */

var DI = {

    // dependencies
    deps: {},

    // register dependency
    add: function(name, obj) {
        if (this.deps[name] !== undefined) {
            throw "dep " + name + " already set";
        }
        this.deps[name] = obj;
    },

    // get dependencies
    get: function(func) {
        var obj;
        obj = new func;
        func.apply(obj, this.resolve(func));
        return obj;
    },

    // resolve dependencies
    resolve: function(func) {
        var args, dep, deps, i;
        args = this.args(func);
        i = args.length;
        deps = [];
        while (i--) {
            dep = this.deps[args[i]];
            if (dep === undefined) {
                throw "dep " + args[i] + " not found";
            }
            deps.push(dep);
        }
        return deps;
    },

    // parse function arguments
    args: function(func) {
        return func.toString().match(/^function\s*[^\(]*\(\s*([^\)]*)\)/m)[1].split(",");
    }
};