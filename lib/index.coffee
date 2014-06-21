url_module  = require 'url'
path_module = require 'path'

module.exports = smart_url_resolve = ( s1, s2 ) ->
  is_absolute = (u) -> u.protocol?
  u1 = url_module.parse s1
  u2 = url_module.parse s2
  if is_absolute u2
    return s2
  if not is_absolute u1
    throw new Error 'need an absolute url as base but found ' + s1
  _path = path_module.resolve u1.pathname, s2
  u1.protocol + '//' + u1.host + _path