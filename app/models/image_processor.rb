## Retrieves images from Freelex, resizes and saves locally
class ImageProcessor
  require 'mini_magick'
  require 'open-uri'

  def initialize(filename:, height:, width:)
    @filename = filename
    @height = height
    @width = width

    @remote_filename = ASSET_URL + filename
    @local_filename = calculate_local_filename
  end

  def resize_and_cache
    return @local_filename if File.exist?(@local_filename)

    image = MiniMagick::Image.open(@remote_filename)
    image.shave CROP_IMAGES_BY if CROP_IMAGES

    # Reset page size to cropped image to avoid offset issue.
    # See here: http://studio.imagemagick.org/pipermail/magick-bugs/2008-May/002933.html
    width  = image['width']
    height = image['height']
    image.set('page', "#{width}x#{height}+0+0")
    image.resize dimensions.join('x') + '>'
    image.format 'png'
    image.write @local_filename

    @local_filename
  end

  private

  def create_or_return_path(filename)
    # ensure the sign path exists
    Dir.mkdir(SIGN_IMAGE_PATH) unless Dir.exist?(SIGN_IMAGE_PATH)

    # It is expected that filename is in the 1212/sdsd.png format
    file_parts = filename.split File::SEPARATOR
    return SIGN_IMAGE_PATH if file_parts.length == 0

    sign_dir = File.join(SIGN_IMAGE_PATH, file_parts[0])

    Dir.mkdir sign_dir unless Dir.exist?(sign_dir)
    sign_dir
  end

  def dimensions
    [@width, @height]
  end

  def calculate_local_filename
    File.join(create_or_return_path(@filename),
              dimensions.join('x') + "-#{@filename.gsub(%r{[\/\\]}, '-')}")
  end
end
