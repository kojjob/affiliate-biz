module Marketing
  class ClickTrackerService
    def self.call(affiliate_link, request)
      # In MVP, just log the click - will expand later
      Rails.logger.info "Affiliate click: \#{affiliate_link.id} from \#{request.remote_ip}"
      
      # Later will implement conversion tracking
    end
  end
end
