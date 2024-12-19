class SchedulePostJob < ApplicationJob
    queue_as :default
  
    def perform(post_id)
      post = Post.find(post_id)
      LinkedInClient.new(post.user.token).publish(post.content)
    end
  end
  