class Mutations::UpdatePost < Mutations::BaseMutation
    field :post, Types::PostType, null: false
    argument :id, Int,required: true
   
    argument :rate, Integer, required: false

    def resolve(id:, rate:)
        post= Post.find(id)
        if post.update(rate: rate)
        puts "post data is: ----- #{post.title}"
        
            {
                post: post,
                errors: []
            }
        else
            {
                post: {},
                errors: post.errors.full_messages
            }
        end
    end

   
end