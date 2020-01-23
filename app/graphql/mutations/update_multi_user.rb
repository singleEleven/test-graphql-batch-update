module Mutations
  class UpdateMultiUser < BaseMutation

    class CreateMultiUserNewInput < Types::BaseInputObject
      argument :email, String, required: true
      argument :name, String, required: true
      argument :password, String, required: true
    end

    class UpdateMultiUserNewInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :email, String, required: false
      argument :name, String, required: false
      argument :password, String, required: false
    end

    class DeleteMultiUserNewInput < Types::BaseInputObject
      argument :id, ID, required: true
    end

    class UpdateMultiUserInput < Types::BaseInputObject
      argument :create_user_new_input, CreateMultiUserNewInput, required: false
      argument :update_user_new_input, UpdateMultiUserNewInput, required: false
      argument :delete_user_new_input, DeleteMultiUserNewInput, required: false
    end

    argument :update_multi_user_input, UpdateMultiUserInput, required: true

    type Boolean

    def resolve(update_multi_user_input: nil)

      create_user_new_input = update_multi_user_input.create_user_new_input
      update_user_new_input = update_multi_user_input.update_user_new_input
      delete_user_new_input = update_multi_user_input.delete_user_new_input

      ActiveRecord::Base.transaction do
        User.create!(
          name: create_user_new_input.name,
          email: create_user_new_input.email,
          password: create_user_new_input.password
        )

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

        user = User.find(delete_user_new_input[:id])
        user.delete
      end
      true
    end
  end
end
    