require 'test_helper'

class GrimoireTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Grimoire::VERSION
  end

  def test_it_does_something_useful
    
    scribe = Grimoire::Scribe.new('./')
    style  = scribe.dye
    # html   = scribe.spell(%{
    #   module Grimoire

    #   end
    # })
    p style
    scribe.render
  end

  # def test_pdfki
  #   kit = PDFKit.new('https://github.com/pdfkit/pdfkit')
  #   # kit = PDFKit.new(File.new('lib/grimoire/template.erb'), :page_size => 'Letter')
  #   # kit.stylesheets << '/path/to/css/file'

  #   # Get an inline PDF
  #   # pdf = kit.to_pdf

  #   # Save the PDF to a file
  #   file = kit.to_file('./out.pdf')
  # end
end
