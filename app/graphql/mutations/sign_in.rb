# frozen_string_literal: true

module Mutations
  class SignIn < BaseMutation
    null true
    description 'Login for users'
    argument :email, String, required: true
    argument :password, String, required: true
    payload_type Types::UserType

    def resolve(email:, password:)
      user = User.find_for_authentication(email: email)
      return nil unless user

      is_valid_for_auth = user.valid_for_authentication? do
        user.valid_password?(password)
      end

      return nil unless is_valid_for_auth

      user
    end
  end
end
