defmodule GraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias GraphqlApiWeb.Resolvers
  # import Types
  import_types(GraphqlApiWeb.Schema.Types)
  
  query do 
    @desc "list all users"
    field :users, list_of(:user_type) do
      # Resolver
      resolve &Resolvers.UserResolver.users/3
    end 
  end

  mutation do
    @desc "register new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve &Resolvers.UserResolver.register_user/3
    end
  end

  # subscription do
  # end
end
