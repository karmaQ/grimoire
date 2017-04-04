require "rouge"
require "erb"
module Grimoire
  class Scribe
    def initialize(dir)
      @files = Dir.glob("**/**")
      @formatter = Rouge::Formatters::HTML.new
      @codes = []
    end

    def dye(theme: 'github')
      Rouge::Theme.find(theme).render(scope: '.codes')
    end

    def spell(source_file)
      if File.directory? source_file 

      else
        l = lexer(source_file)
        if l
          source = File.read(source_file)
          @formatter.format l.lex(source)
        end
      end
    end

    def lexer(source_file)
      ext_name = File.extname(source_file) 
      case ext_name
      when '.rb'
        @ruby_lexer ||= Rouge::Lexers::Ruby.new
      when '.js'
        @js_lexer ||= Rouge::Lexers::Javascript.new
      when '.json'
        @json_lexer ||= Rouge::Lexers::JSON.new 
      end
    end

    def index

    end

    def render
      # filename = File.expand_path('../template.erb', __FILE__)
      # erb = ERB.new(File.read(filename))
      @codes = @files.map { |file| spell(file) }
    end
  end
end
