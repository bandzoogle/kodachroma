module Chroma
  module Converters
    class HsvConverter < Base
      def convert_rgb
        r = bound01(@input.r, 255)
        g = bound01(@input.g, 255)
        b = bound01(@input.b, 255)

        rgb_array = [r, g, b]

        max = rgb_array.max
        min = rgb_array.min
        v = max
        d = (max - min).to_f
        s = max.zero? ? 0 : d / max

        if max == min
          h = 0
        else
          h = case max
              when r then (g - b) / d + (g < b ? 6 : 0)
              when g then (b - r) / d + 2
              when b then (r - g) / d + 4
              end

          h /= 6.0
        end

        ColorModes::Hsv.new(h * 360, s, v, @input.a)
      end
    end
  end
end
