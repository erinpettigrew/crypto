module UsersHelper
  def user_has_invites?
    if user_signed_in?
      return true if current_user.invitation_limit > 0
    end
  end

  def render_invitation_badge
    if user_has_invites?
      "<span class='badge'>#{current_user.invitation_limit}</span>".html_safe
    end
  end

  def render_rating_stars(rating)
    star_html = ''
    rating.times do
      star_html << "★"
    end
    star_html.html_safe
  end
end
