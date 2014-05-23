require 'rqrcode'
require 'RMagick'

include Magick

class PrettyQrcode

  attr_accessor :map, :image

  def initialize data, image_path, size: 4, level: :h
    @data = data
    @image_path = image_path
    @size = size
    @level = level

    @map_size = (17 + @size * 4 ) * 3
    @map = Array.new @map_size
    @map.each_index {|i|@map[i] = Array.new @map_size}
  end

  def make
    read
    resize
    monochrome
    generate_qr
    draw_image
    draw_qr
    draw_base
    draw_back
  end

  def read
    @image = ImageList.new @image_path
  end

  def resize
    @image = @image.resize @map_size, @map_size
  end

  def monochrome
    @image.image_type= Magick::BilevelType
  end

  def generate_qr
    @qr = RQRCode::QRCode.new(@data, :size => @size, :level => @level )
  end

  def draw_image
    @image.each_pixel do |pixel, c, r|
      @map[r][c] = pixel.intensity > 32767 ? true : false
    end
  end

  def draw_qr
    @qr.modules.each_index do |x|
      @qr.modules.each_index do |y|
        if @qr.dark?(x,y)
          @map[x*3+1][y*3+1] = false
        else
          @map[x*3+1][y*3+1] = true
        end
      end
    end
  end

  def draw_base
    common = @qr.instance_variable_get("@common_patterns")
    @qr.modules.each_index do |x|
      @qr.modules.each_index do |y|
        if common[x][y].nil?
          next
        elsif common[x][y]
          (0..2).each do |i|
            (0..2).each do |j|
              @map[x*3+i][y*3+j] = false
            end
          end
        else
          (0..2).each do |i|
            (0..2).each do |j|
              @map[x*3+i][y*3+j] = true
            end
          end
        end
      end
    end
  end

  def print
    @map.map do |line|
      line.map {|p|p ? ' ' : 'X'}.join
    end.join("\n")
  end

  def draw_back
    @map.each_index do |x|
      @map[x].each_index do |y|
        @image.import_pixels y, x, 1, 1, 'I', [@map[x][y] ? 65535 : 0]
      end
    end
  end

  def save file
    @image.write file
  end
end
