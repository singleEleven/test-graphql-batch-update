module Mutations
  class CreateUserNew < BaseMutation

    class CreateUserNewInput < Types::BaseInputObject
      argument :email, String, required: true
      argument :name, String, required: true
      argument :password, String, required: true
    end

    argument :create_user_new_input, CreateUserNewInput, required: true

    type Types::UserType

    def resolve(create_user_new_input: nil)
      User.create!(
        name: create_user_new_input.name,
        email: create_user_new_input.email,
        password: create_user_new_input.password
      )
    end
  end
end
  