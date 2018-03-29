require_relative './lang'

module Yml2utx

  class Value

    @@counter = 0
    @id=0
    
    def initialize value
      raise "to many characters for name" if value['name'].length > 12
      @id = value['id'] || @@counter
        
      @comment = value['comment']
      @name = value['name']
      
      @lang = []
      
      @@counter+=1
      begin
        create_lang value['lang']
      rescue => ex
        puts ex
      end
    end

    def create_lang langs
      langs.each{ |l|
        l.each { |key, value|
          @lang.push( Yml2utx::Language.new(key,value) )
        }
      } 
    end

    def name
      @name
    end

    def id
      @id
    end
    
    def comment
      @comment
    end
    
    def lang
      @lang
    end
    
  end
  
end
