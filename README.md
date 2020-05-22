# RubyAbstractClass

This gem is going to fix the problem with Polymorphism in Ruby language. You can easily define abstract methods and abstract classes which were, unfortunately, missing in Ruby originally. Now you can define your strategy and allow subclass to implement it. Enjoy and feel free to ask any questions via issues section here in GitHub.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_abstract_class'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ruby_abstract_class

## Usage

To make class abstract you need to include `RubyAbstractClass` module and specify which methods are abstract by `abstract_method` method. Here you go.

```ruby
class A
  include RubyAbstractClass

  def foo(_params)
  end
  abstract_method :foo # a single method

  abstract_method :bar, :foobar # multiple methods

  abstract_method # just make an abstract class without any abstract methods for now
end


class B < A
  def foo
    puts 'foo'
  end

  def bar
    puts 'bar'
  end
end

B.new.foo # => foo
B.new.bar # => bar

B.new.foobar # => exception: You must implement B#foobar.

A.new # => exception: You cannot instantiate an instance of Abstract Class `A`.
```

Thank you :)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_abstract_class. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/ruby_abstract_class/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyAbstractClass project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_abstract_class/blob/master/CODE_OF_CONDUCT.md).
