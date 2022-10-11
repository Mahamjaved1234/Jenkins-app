module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :delete_post, mutation: Mutations::DeletePost
    # TODO: remove me
    # TODO: remove me
   
  end
end
