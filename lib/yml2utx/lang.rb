module Yml2utx

  class Language
    attr_accessor :code, :word

    def initialize code, word
      @code = code
      if word.length > 254
          raise "to many characters"
      end
      
      @word = word  
    end
  end
  
end
