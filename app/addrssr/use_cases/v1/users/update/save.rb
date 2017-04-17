module UseCases
  module V1
    module Users
      module Update

        class Save < UseCases::Base
          required_context :user

          def perform
            return if user.save

            failure!(:unprocessable_entity, "could not save the user")
          end
        end

      end
    end
  end
end
