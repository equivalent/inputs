# Inputs

Really stupid primitive Gem that will handle some common console operations.

```
require 'inputs'

Inputs.yn('Are you stupid?')
# Are you stupid? [y/n]
# => true / false

Inputs.name('What is your name')
# What is your name
# => String

Inputs.names('Names of your parents')
# Names of your parents
# => Array
```

## Installation

Gem is so primitive that I'm not even bothering to release it to Rubygems

```ruby
gem 'inputs', github: 'equivalent/inputs'
```

And then execute:

    $ bundle

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

