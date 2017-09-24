module CarrierWave
  module MiniMagick

    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end

    def optimize
	    manipulate! do |img|
	      img.scale("20%")
	      img.size("24%")
	      img.quality("[0..100]")
	      img = yield(img) if block_given?
	      img
	    end
  	end
  end
end