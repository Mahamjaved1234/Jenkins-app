require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  def test_post
    post = Post.new()   
    post.save  
   
  end

  def test_destory
    post = Post.find(980190962).destroy.save
    puts"#{post}"
   
  end
def test_update 
  post = Post.update({:author=>"maham"})
 
  puts"#{post}"
end
end