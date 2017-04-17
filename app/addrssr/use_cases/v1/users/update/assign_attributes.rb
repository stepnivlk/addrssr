module UseCases
  module V1
    module Users
      module Update

        class AssignAttributes < UseCases::Base
          required_context :user

          def perform
            user.assign_attributes user_attributes
          end

          private

          def user_attributes
            (context.user_attributes || {}).with_indifferent_access.slice \
              :email,
              :first_name,
              :last_name
          end
        end

      end
    end
  end
end
