[![Build Status](https://travis-ci.org/equivalent/inputs.svg?branch=master)](https://travis-ci.org/equivalent/inputs)
[![Open Thanks](https://thawing-falls-79026.herokuapp.com/images/thanks-2.svg)](https://thawing-falls-79026.herokuapp.com/r/fpjrqlob)

# Inputs

Really stupid primitive Gem that will handle some common console operations.

The gem aims to be really simple. If you looking for something more complex I recommend to use
[TTY](http://piotrmurach.github.io/tty/),[tty-prompt](https://github.com/piotrmurach/tty-prompt)

[Reddit discussion](https://www.reddit.com/r/ruby/comments/4i5dep/gem_inputs_another_pointless_gem_for_handling/)

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

Inputs.pick(['cat', 'dog'])
# Please choose
#   Press 1 for "cat"
#   Press 2 for "dog"

## after pressing 1
# => 'cat'

## after pressing 2
# => 'dog'
```

## Installation

Option 1:

`gem install inputs`

Option 2 (If you use `bundler`) :

```ruby
# Gemfile
gem 'inputs'
```

And then execute:

```bash
$ bundle
```

## Example

```ruby
# foo.rb
require 'inputs'

class Foo
  def call
    name = Inputs.name("what is your name")

    if Inputs.yn("Ok #{name}, do you want to learn music instrument?")
      instrument = Inputs.pick(instrument_options)

      case instrument
      when drums
        puts 'Metal dude ! \,,/'
      when guitar
        puts "Rock on dude !"
      when harp
        puts "W.T.F dude ?"
      end
    else
      puts "Then go home #{name} !"
    end
  end

  private
    def instrument_options
      [
        drums,
        guitar,
        harp
      ]
    end

    def drums
      'Drums'
    end

    def guitar
      'Guitar'
    end

    def harp
      'Harp'
    end
end

Foo.new.call
```

![Inputs gem example](https://raw.githubusercontent.com/equivalent/scrapbook2/master/assets/images/2016/inptus-gem-example.png)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contribution

I welcome any suggestions & Pull Requests. Currently there is not lot of
tests as I thought I will never release this lib so if you decide to do
a PR please write a test.

Thank you

