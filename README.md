# Yml2utx

A FANUC robot contoller software makes it possible to change the program language according to the system language. Sadly FANUC uses a own language code.

I build this project to make it more easy for me building dictionaries. FANUC calls the files .UTX
To use the .UTX use the ktrans compiler to make a .TX file. The .TX file can load into the controller.

This projects helps you building a UTX file with the translation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yml2utx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yml2utx

## Usage

To write the .UTX file set the dictonary name. This name is used for the file name. FANUC has the restriction that the directory file is named with a four charactar name and the two character contry code.
The kl file name containing all the karel Variable names can contain 12 charaters.

```
---
name: test
kl: test_kl
content:
  - value:
      name: test
      id: 1
      lang:
        - en: run
        - gr: start
  - value:
       name: test2
       id: 2
       lang:
	- en: stop
	- gr: stopp
```

As you can see the structure of the YAML file.

1. the dictionary name. The name length is limited to 4 characters
2. the KAREL file name. The name length is limited to 12 characters
3. the content with the different values.
   3.1 the name of the variable. This will be translat into the KAREL Variable name.
   3.2 the id. The ID is the first element in the line of the .UTX file and has to be unique.
   3.3 the language code with the label

The system checks the country code and builds one seperate file for each new language code.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/afeldman/yml2utx.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
