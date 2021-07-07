module SubpitchesHelper
  def check_like rating
    LikeRating.find_by rating_id: rating.id, user_id: current_user.id
  end
end
