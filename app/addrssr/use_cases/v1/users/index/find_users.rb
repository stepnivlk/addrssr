module UseCases
  module V1
    module Users
      module Index

        class FindUsers < UseCases::Base
          required_context :organisation

          def perform
            context.users = organisation.users
          end
        end

      end
    end
  end
end
