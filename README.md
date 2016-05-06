[![Build Status](https://travis-ci.org/equivalent/inputs.svg?branch=master)](https://travis-ci.org/equivalent/inputs)

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

```ruby
gem 'inputs'
```

And then execute:

    $ bundle

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
        puts "Metal dude ! \,,/"
      when guitar
        puts "Rock on dude !"
      when harph
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
        harph
      ]
    end

    def drums
      'Drums'
    end

    def guitar
      'Guitar'
    end

    def harph
      'Harph'
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

