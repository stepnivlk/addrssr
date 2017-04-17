module UseCases
  module V1
    module Users
      module Index

        class Base < UseCases::Base
          depends Organisations::Show::FindOrganisation,
                  FindUsers

          def final
            authorize :organisation

            context.data = context.error_response

            return unless context.ok?

            context.data = context.users
          end
        end

      end
    end
  end
end
