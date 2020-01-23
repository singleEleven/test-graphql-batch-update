module Mutations
  class DeleteUserNew < BaseMutation

    class DeleteUserNewInput < Types::BaseInputObject
      argument :id, ID, required: true
    end

    argument :delete_user_new_input, DeleteUserNewInput, required: true

    type Boolean

    def resolve(delete_user_new_input: nil)
      user = User.find(delete_user_new_input[:id])
      user.delete
      true
    end
  end
end
    