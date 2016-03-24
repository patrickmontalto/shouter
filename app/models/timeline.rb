class Timeline
  include ActiveModel::Model

  def initialize(user)
    @user = user
  end

  def shouts
    #@user.shouts #+ Shout.where(user_id: @user.followed_user_ids) SELECT * FROM shouts WHERE user_id IN (1,2,3,4)
    Shout.where(user_id: shout_user_ids)
  end

  private

    def shout_user_ids
      [@user.id] + @user.followed_user_ids
    end
end