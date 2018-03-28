require_relative './value'

module Yml2utx

  class Parse
    
    def initialize dat={}
      
      @data = {}
      @value = []
      @name = ''
      @kl = @name

      if not dat.empty?
        @data = dat
        @values = []
        @name = @data['name']
        @kl = @data['kl'] || @name 
        build
      end
    end

    def values
      @values
    end

    def name
      @name
    end

    def kl
      @kl
    end

    def build
      content = @data['content']

      # create values
      content.each{ |con|
        @values.push(create_value con['value'])
      }
    end

    def create_value v
      Yml2utx::Value.new v
    end    
  end
end
 
