class Mutations::CreatePost < Mutations::BaseMutation
    def ready?(**_args)
        if !context[:current_user]
          raise GraphQL::ExecutionError, "You need to login!"
        else
          true
        end
      end
    
    field :post, Types::PostType, null: false
    
    argument :id, Integer,required: false
    

    argument :title, String, required: false
    argument :author, String, required: false 
    argument :content, String, required: false
    argument :rate, Integer, required: false

   # puts"HERES THE CURRENT USER ----------- : #{context[:current_user].id}"
   
    def resolve(title:, rate:,author:,content:)
        post = context[:current_user].Post.new(title: title, rate: rate,author: author,content: content, created_at: Time.now, updated_at: Time.now, user_id: current_user)
        puts "post data is: ----- #{post}"
        if 
            post.save
            {
                post: post,
                errors: []
            }
        else
            {
                post: {},
                errors: posts.errors.full_messages
            }
        end
    end
end