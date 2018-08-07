require 'yaml'

require_relative 'yml2utx/parse_yml'
require_relative 'yml2utx/utx'
require_relative 'yml2utx/version'

module Yml2utx

  def self.start(name)
    utx_yml = YAML.load( name )

    Yml2utx::Parse.new(utx_yml)
  end

end
