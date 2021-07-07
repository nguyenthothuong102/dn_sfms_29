class SubpitchesController < ApplicationController
  before_action :load_pitch
  before_action :load_subpitch, only: :show

  def index
    @subpitches = Subpitch.pitch(params[:pitch_id].to_i)
  end

  def show
    @ratings = Rating.joins(booking: :subpitch)
                     .where(bookings: {subpitch_id: @subpitch.id})
  end

  private

  def load_pitch
    @pitch = Pitch.find_by id: params[:pitch_id]
    return if @pitch

    flash[:danger] = t ".subpitches.danger_load"
    redirect_to root_path
  end

  def load_subpitch
    @subpitch = Subpitch.find_by id: params[:id]
    return if @subpitch

    flash[:danger] = t ".subpitches.danger_load_subpitch"
    redirect_to root_path
  end
end
