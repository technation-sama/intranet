require 'ipaddr'

module SamaIPFilters

    def self.included(base)
        base.before_action :samafilter
    end

    # Protected methods
    # --------------------------------------------------------------------------------
    protected

    # For the current user, if his brand has a `whitelisted_ips` list, then verify the
    # current connection is from a verified IP
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
                
            end
        end
    end
end
