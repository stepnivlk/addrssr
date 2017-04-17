module UseCases
  module V1
    module Users
      module Show

        class FindUser < UseCases::Base
          required_context :user_id

          def perform
            get_user

            failure!(:not_found, 'User not found for given id') \
              unless context.user
          end

          private

          def get_user
            context.user = User.find_by(id: user_id)
          end
        end

      end
    end
  end
end
