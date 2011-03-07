Filtered-Client: Socket.io
============================================

This module adds a new Transport Client to Socket.io called "filteredClient", with which you can make socket.io connections based on publish/subscribe patterns. Clients can register to receive only certain messages

## Requirements

- a patched version of socket.IO-Node. Unfortunately right now this is not part of the official release yet. I have come up however with an architecture, thats needs nearly no changes to Socket.IO, and have started a pull request. I will update to the official version of socket.io-Node as soon as this modification is in the master tree.

## How to use

You should not need to use this class directly. I built this class for usage with my projects. You should consider using one of those. E.g object-sync.


## Modifications to Socket.io

- a static function called addTransport is exposed to the outside world to add new transports to socket.io
- the Client base class of every transport is exposed to the outside world

## Credits

- Gregor Schwab &lt;greg@synaptic-labs.net&gt; ([dotmaster](http://github.com/dotmaster))

- Guillermo Rauch &lt;guillermo@learnboost.com&gt; ([Guille](http://github.com/guille))

- Arnout Kazemier ([3rd-Eden](http://github.com/3rd-Eden))

## License 

(The MIT License)

Copyright (c) 2011 Gregor Schwab &lt;dev@synaptic-labs.net&gt;

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
