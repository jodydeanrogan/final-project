class ClarifaisController < ApplicationController

  def get_image_tags
    @image_url = params[:image_url]
    @token = Clarifai.get_token
    @token = @token[:access_token]
    @response = Clarifai.get_tags(@token, @image_url)
    @tags = @response[:tags]
    respond_to do |format|
      format.js { render :json => @tags }
    end
  end

end
