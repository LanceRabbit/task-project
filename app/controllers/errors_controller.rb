class ErrorsController < ApplicationController
  def wrong_path
    render_404
  end
end
