class AffiliateLinksController < ApplicationController
  def redirect
    @link = Marketing::AffiliateLink.find(params[:id])
    
    # Track the click
    Marketing::ClickTrackerService.call(@link, request)
    
    redirect_to @link.destination_url, allow_other_host: true
  end
end
