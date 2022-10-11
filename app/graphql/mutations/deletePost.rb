class Mutations::DeletePost < Mutations::BaseMutation
    field :post, Types::PostType, null: false
    argument :id, Integer,required: true
    

    def resolve(id:)
        post= Post.find(id)
        if post.delete()
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