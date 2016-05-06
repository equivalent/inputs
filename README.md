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

```bash
# bundle exec ruby foo.rb

# run 1
what is your name
Tomas
Tomas
Ok Tomas, do you want to learn music instrument? [y/n]
y
Please choose:
  Press 1 for "Drums"
  Press 2 for "Guitar"
  Press 3 for "Harph"
1
Metal dude ! ,,/

# run 2
what is your name
Leo
Leo
Ok Leo, do you want to learn music instrument? [y/n]
n
Then go home Leo !

# run 3
what is your name
Carl
Carl
Ok Carl, do you want to learn music instrument? [y/n]
y
Please choose:
  Press 1 for "Drums"
  Press 2 for "Guitar"
  Press 3 for "Harph"
3
W.T.F dude ?
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contribution

I welcome any suggestions & Pull Requests. Currently there is not lot of
tests as I thought I will never release this lib so if you decide to do
a PR please write a test.

Thank you

