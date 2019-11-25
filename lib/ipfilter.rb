require 'ipaddr'

module SamaIPFiltersdd

    def self.included(base)
        base.before_action :samafilter
    end


    def samafilterss
          user_ip = IPAddr.new(request.remote_ip)
          # An array of IPs and IP ranges that should be allowed. Stored on the current user.
          allowed_ips = "192.168.88.0/24,195.202.89.53/30,41.215.29.158/30,197.155.72.178/28,105.21.40.18/30,197.248.225.250/30".split(",")
          # Validate IP only if allowed_ips array is set, otherwise there is no IP restriction

          verified = false
          allowed_ips.each do |allowed_ip|
              allowed_ip = IPAddr.new(allowed_ip)
              if allowed_ip.include?(user_ip)
                  verified = true
              end
          end
          # Redirect back to main page if not verified
          unless verified
            redirect_to root_path, notice: "Can only access from Samasource office"
          end
    end
end
