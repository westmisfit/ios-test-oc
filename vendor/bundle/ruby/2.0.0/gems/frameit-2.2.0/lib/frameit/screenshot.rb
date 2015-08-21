module Frameit
  # Represents one screenshot
  class Screenshot
    attr_accessor :path # path to the screenshot
    attr_accessor :size # size in px array of 2 elements: height and width
    attr_accessor :screen_size # deliver screen size type, is unique per device type, used in device_name
    attr_accessor :color # the color to use for the frame

    # path: Path to screenshot
    # color: Color to use for the frame
    def initialize(path, color)
      raise "Couldn't find file at path '#{path}'".red unless File.exists?path
      @color = color
      @path = path
      @size = FastImage.size(path)

      @screen_size = ENV["FRAMEIT_FORCE_DEVICE_TYPE"] || Deliver::AppScreenshot.calculate_screen_size(path) 
    end

    # Device name for a given screen size. Used to use the correct template
    def device_name
      sizes = Deliver::AppScreenshot::ScreenSize
      case @screen_size
        when sizes::IOS_55
          return 'iPhone_6_Plus'
        when sizes::IOS_47
          return 'iPhone_6'
        when sizes::IOS_40
          return 'iPhone_5s'
        when sizes::IOS_35
          return 'iPhone_4'
        when sizes::IOS_IPAD
          return 'iPad_mini'
        when sizes::MAC
          return 'Mac'
      end
    end

    # Is the device a 3x device? (e.g. 6 Plus)
    def is_triple_density?
      (screen_size == Deliver::AppScreenshot::ScreenSize::IOS_55)
    end

    # Super old devices
    def is_mini?
      (screen_size == Deliver::AppScreenshot::ScreenSize::IOS_35)
    end

    def is_mac?
      return device_name == 'Mac'
    end

    # The name of the orientation of a screenshot. Used to find the correct template
    def orientation_name
      return Orientation::PORTRAIT if size[0] < size[1]
      return Orientation::LANDSCAPE
    end

    def is_portrait?
      return (orientation_name == Orientation::PORTRAIT)
    end

    def to_s
      self.path
    end

    # Add the device frame, this will also call the method that adds the background + title
    def frame!
      if self.is_mac?
        MacEditor.new.frame!(self)
      else
        Editor.new.frame!(self)
      end
    end
  end
end