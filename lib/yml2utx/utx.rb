require 'fileutils'

module Yml2utx

  class Utx

    attr_accessor :code, :file_name

    def initialize code, name, kl, path

      @code = code
      @file_name=File.join(path,"#{name}#{code}.utx")

      FileUtils.mkdir_p path

      open(@file_name, 'w'){ |f|
        f.puts ".kl #{kl}"
      }
    end

    def write value
      open(@file_name, 'a') { |f|
        f.puts "* #{value.comment}" unless value.comment == nil
        f.puts "$#{value.id},\t#{value.name}\t\'#{value.lang[0].word}\'"
      }
    end

  end

end
