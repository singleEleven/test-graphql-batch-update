module Mutations
  class UpdateUserNew < BaseMutation

    class UpdateUserNewInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :email, String, required: false
      argument :name, String, required: false
      argument :password, String, required: false
    end

    argument :update_user_new_input, UpdateUserNewInput, required: true

    type Types::UserType

    def resolve(update_user_new_input: nil)
      user = User.find(update_user_new_input.id)

      if update_user_new_input.email
        user.email = update_user_new_input.email
      end

      if update_user_new_input.password
        user.password = update_user_new_input.password
      end

      if update_user_new_input.name
        user.name = update_user_new_input.name
      end

      user.save!

      user

    end
  end
end
  