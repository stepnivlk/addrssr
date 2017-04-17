module UseCases
  module V1
    module Users
      module Update

        class Base < UseCases::Base
          depends Organisations::Show::FindOrganisation,
                  Show::FindUser,
                  AssignAttributes,
                  Validate,
                  Save

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
