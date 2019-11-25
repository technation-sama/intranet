class CategoriesController < ApplicationController
  before_action :samafilter
  def downloads
  	@categories = Category.all
  end

  private
    def samafilter
        user_ip = IPAddr.new(request.remote_ip)
        # An array of IPs and IP ranges that should be allowed. Stored on the current user.
        allowed_ips = ENV["LINKS_SAMA"].split(",")
        # Validate IP only if allowed_ips array is set, otherwise there is no IP restriction

        if allowed_ips
            verified = false
            allowed_ips.each do |allowed_ip|
                allowed_ip = IPAddr.new(allowed_ip)
                if allowed_ip.include?(user_ip)
                    verified = true
                end
            end
            # Redirect back to main page if not verified
            unless verified
                redirect_to root_url
            end
        end
    end
end
