class ImageHelper
  require 'mini_magick'
  require 'securerandom'
  
  #content
  BASE_IMAGE_PATH = './app/assets/images/back.png'.freeze
  GRAVITY = 'West'.freeze
  TEXT_POSITION = '125,0'.freeze
  FONT = './app/assets/fonts/ipaexm.ttf'.freeze
  FONT_SIZE = 28
  INDENTION_COUNT = 15
  ROW_LIMIT = 8
  
  #your_name
  GRAVITY2 = 'center'.freeze
  TEXT_POSITION2 = '0,-200'.freeze
  FONT_SIZE2 = 35
  INDENTION_COUNT2 = 10
  ROW_LIMIT2 = 2
  
  #my_name
  TEXT_POSITION3 = '0,250'.freeze
  
  #title
  TEXT_POSITION4 = '0,-300'.freeze
  FONT_SIZE4 = 45
  INDENTION_COUNT4 = 3
  ROW_LIMIT4 = 1
  
  
  

  class << self
    # 合成後のFileClassを生成
    def build(text)
      text = prepare_text(text)
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      configuration(text)
    end
    
    def build2(text)
      text = prepare_text2(text)
      configuration2(text)
    end
    
    def build3(text)
      text = prepare_text3(text)
      configuration3(text)
    end
    
    def build4(text)
      text = prepare_text4(text)
      configuration4(text)
    end

    # 合成後のFileの書き出し
    def write(text,name)
      build4(text)
      @image.write "public/#{uniq_file_name(name)}"
    end

    private
    
    def uniq_file_name(name)
      name = SecureRandom.hex if name.blank?
      "#{name}.png"
    end

    # 設定関連の値を代入
    def configuration(text)
      @image.combine_options do |config|
        config.font FONT
        config.gravity GRAVITY
        config.pointsize FONT_SIZE
        config.interline_spacing 10
        config.draw "text #{TEXT_POSITION} '#{text}'"
      end
    end
    
    def configuration2(text)
      @image.combine_options do |config|
        config.font FONT
        config.gravity GRAVITY2
        config.pointsize FONT_SIZE2
        config.draw "text #{TEXT_POSITION3} '#{text}'"
      end
    end
    
    def configuration3(text)
      @image.combine_options do |config|
        config.font FONT
        config.gravity GRAVITY2
        config.pointsize FONT_SIZE2
        config.draw "text #{TEXT_POSITION2} '#{text}'"
      end
    end
    
    def configuration4(text)
      @image.combine_options do |config|
        config.font FONT
        config.gravity GRAVITY2
        config.pointsize FONT_SIZE4
        config.draw "text #{TEXT_POSITION4} '#{text}'"
      end
    end

    # 背景にいい感じに収まるように文字を調整して返却
    def prepare_text(text)
      text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
    
    def prepare_text2(text)
      text.scan(/.{1,#{INDENTION_COUNT2}}/)[0...ROW_LIMIT2].join("\n")
    end
    
    def prepare_text3(text)
      text.scan(/.{1,#{INDENTION_COUNT2}}/)[0...ROW_LIMIT2].join("\n")
    end
    
    def prepare_text4(text)
      text.scan(/.{1,#{INDENTION_COUNT4}}/)[0...ROW_LIMIT4].join("\n")
    end
  end
end