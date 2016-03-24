module ShoutCreateable
  extend ActiveSupport::Concern

  def create
    content = build_content
    shout = current_user.shouts.build(content: content)
    if shout.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Could not shout"
      redirect_to dashboard_path
    end
  end
end