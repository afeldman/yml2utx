require 'yaml'

require_relative 'yml2utx/parse_yml'
require_relative 'yml2utx/utx'

module Yml2utx

  utx_yml = YAML.load_file( ARGV[0])
  target = ARGV[1] || ''

  x = Yml2utx::Parse.new(utx_yml)

  ## first parse all values for the contry code (FANUC has special codes, not the international standard codes)
  lang_codes = []
  x.values.each { |val|
    val.lang.each {|l|
      lang_codes.push(l.code)
    }
  }
  
  ## create with this information the utx fikes
  utx_files={}
  lang_codes.uniq!.each { |contry_code|
    utx_files[contry_code] = Yml2utx::Utx.new(contry_code,
                                              x.name,
                                              x.kl,
                                              target)
  }

  ## write all values to the new files.
  x.values.each { |val|
    # write in each of the language file the data
    val.lang.each {|l|
      utx_files[l.code].write val
    }
  }
  
  
end
