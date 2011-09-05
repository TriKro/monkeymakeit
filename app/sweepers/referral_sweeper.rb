class ReferralSweeper < ActionController::Caching::Sweeper

  observe Referral

  def after_create(referral)
    if referral.user.referrals.count == 1
      km.record('referral', { 'invitee' => referral.user.identifier, 'inviter' => referral.invite.user.identifier, 'story' => referral.invite.story.title, 'author' => referral.invite.story.user.identifier, 'url' => request.referer.split("?")[0] })
    else
      km.record('activity', { 'type' => 'accepted recommendation', 'invitee' => referral.user.identifier, 'inviter' => referral.invite.user.identifier, 'story' => referral.invite.story.title, 'author' => referral.invite.story.user.identifier, 'url' => request.referer.split("?")[0] })
    end
  end

end