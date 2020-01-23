module Types
  class MutationType < BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_link, mutation: Mutations::CreateLink
    field :create_vote, mutation: Mutations::CreateVote
    field :signin_user, mutation: Mutations::SignInUser
    field :create_user_new, mutation: Mutations::CreateUserNew
    field :update_user_new, mutation: Mutations::UpdateUserNew
    field :delete_user_new, mutation: Mutations::DeleteUserNew
    field :update_multi_users, mutation: Mutations::UpdateMultiUser
  end
end
