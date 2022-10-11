module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :post,
    [Types::PostType], 
    null: false,
    description: "List of posts"
    # field :users,
    # [Types::UserType], 
    # null: false,
    # description: "List of users"
    
    def post
      Post.all

    end
    
      
    # def users
    #   User.all
    # end
   
    
  end
end
