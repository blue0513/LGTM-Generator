require 'RMagick'

@text = 'LGTM'
@color = 'red'

def generate(file:, text:, color:)
  img = Magick::Image.read(file).first

  width = img.columns
  size = width / @text.size

  # TODO: position
  lgtm = Magick::Draw.new
  lgtm.annotate(img, 0, 0, 0, 0, text) do
    self.font = 'Helvetica'
    self.pointsize = size
    self.font_weight = Magick::BoldWeight
    self.fill = color
    self.gravity = Magick::SouthEastGravity
  end

  img.write('result.png')
end

ARGV.each_with_index do |arg, i|
  @file = arg.to_s if i == 0
  @color = arg.to_s if i == 1
end

generate(file: @file, text: @text, color: @color)
