class PitchesController < ApplicationController
  before_action :load_time
  def create; end

  def index
    @pitches = Pitch.search_city(params[:pitch][:city])
                    .search_district(params[:pitch][:district])
                    .search_pitches(params[:pitch][:address])
                    .search_time(start_time: @start_time, end_time: @end_time)
                    .paginate page: params[:page],
                                             per_page: Settings.size.s_12
  end

  private
  def load_time
    @start_time = Time.strptime(params[:pitch]["start_time(4i)"] <<
                        ":" << params[:pitch]["start_time(5i)"], "%H:%M")
    @end_time = Time.strptime(params[:pitch]["end_time(4i)"] <<
                      ":" << params[:pitch]["end_time(5i)"], "%H:%M")
  end
end
