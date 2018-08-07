require 'spec_helper'
require 'pathname'
require 'yml2utx'

describe Yml2utx do

  before(:each) do
    testinfo = '---
name: test
kl: test_kl
content:
  - value:
      name: test2
      id: 1
      lang:
        - en: tested
        - gr: testet
  - value:
      name: test
      id: 2
      lang:
        - en: time
        - gr: Zeit
    '

    @parser = Yml2utx::start(testinfo)
  end

  it 'has a version number' do
    expect(Yml2utx::VERSION).to eq "0.1.0"
  end

  describe 'test parser' do
    context 'get into' do
      it 'has values' do

        @parser.values.each { |val|
          val.lang.each { |lang|
            expect(lang.code).to eq('en').or( eq 'gr')
          }
        }
      end

      it 'build UTX' do
        lang_codes = []
        @parser.values.each { |val|
          val.lang.each { |lang|
            lang_codes<<lang.code
          }
        }

        lang_codes.uniq!.each { |contry_code|
          Yml2utx::Utx.new(contry_code,
                           @parser.name,
                           @parser.kl,
                           '../test/')
        }

        expect(Pathname.new('../test/testen.utx')).to be_file
        expect(Pathname.new('../test/testgr.utx')).to be_file
      end

    end
  end

end
