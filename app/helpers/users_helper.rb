module UsersHelper
  def add_friend_link(user, current_user)
    if user.no_relation?(current_user) && user != current_user
      link_to "Add Friend", user_friendships_path(user), :method => 'post'
    end
  end

  def remove_friend_link(user, current_user)
    if user.friend?(current_user) && user != current_user
      link_to "Remove Friend", user_friendship_path(user, current_user), :method => 'delete', :confirm => "Are you sure?"
    end
  end

  def confirm_friendship_link(user, current_user)
    if user.requested_friend?(current_user) && user != current_user
      link_to "Confirm Friend", user_friendship_path(user, current_user), :method => 'put'
    end
  end

  def reject_friendship_link(user, current_user)
    if user.requested_friend?(current_user) && user != current_user
      link_to "Reject Friend", user_friendship_path(user, current_user), :method => 'delete', :confirm => "Are you sure?"
    end
  end

  def cancel_friendship_link(user, current_user)
    if user.pending_friend?(current_user) && user != current_user
      link_to "Cancel Friend", user_friendship_path(user, current_user), :method => 'delete', :confirm => "Are you sure?"
    end
  end
end
