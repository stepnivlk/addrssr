module UseCases
  module V1
    module Users
      module Show

        class Base < UseCases::Base
          depends Organisations::Show::FindOrganisation,
                  FindUser

          def final
            authorize :organisation, :user

            context.data = context.error_response

            return unless context.ok?

            context.data = context.user
          end
        end

      end
    end
  end
end
