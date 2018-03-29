require_relative './value'

module Yml2utx

  class Parse
    
    def initialize dat={}
      
      @data = {}
      @value = []
      @name = 'DICT'
      @kl = @name

      if not dat.empty?
        @data = dat
        @values = []
        @name = @data['name']
        raise 'dictonary name to long. only 4 letters' if @name.length > 4
        @kl = @data['kl'] || @name 
        raise 'kl name is to long. please 12 letters' if @kl.length > 12 
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
 
