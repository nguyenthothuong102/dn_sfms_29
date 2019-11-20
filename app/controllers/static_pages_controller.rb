class StaticPagesController < ApplicationController
  def home
    @pitches = Pitch.latest_pitches.paginate page: params[:page],
                                             per_page: Settings.size.s_12
    @pitch = Pitch.new
  end

  def blog; end

  def about; end

  def contact; end
end
