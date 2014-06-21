
E = require('assert').equal
S = require '../lib'

E 'http://foo.com/a',      S 'http://foo.com', 'a'
E 'https://foo.com/a',     S 'https://foo.com', 'a'
E 'http://foo.com/a/b/c',  S 'http://foo.com/a/', 'b/c'
E 'http://foo.com/a/b/d',  S 'http://foo.com/a/b/c', '../d'
E 'http://foo.com/',       S 'http://foo.com/a/b/c', '/'
E 'http://bar.com/',       S 'http://foo.com/a/b/c', 'http://bar.com/'
E 'http://foo.com/a/b/c',  S 'http://foo.com/a/b/c', '.'
E 'http://foo.com/a/b/c',  S 'http://foo.com/a/b/c', ''