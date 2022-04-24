# ToyTrain
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "toy_train"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install toy_train
```

## Installation

### Models

#### Install Migrations

```sh
bin/rails toy_train:install:migrations
```

## Configuration

In an initializer, do:

```rb
ToyTrain.configure do |config|
  config.games = [] # ActiveHash data
  config.user_class = "Participant" # default "User"
end
```



## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
