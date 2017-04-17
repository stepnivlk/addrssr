module UseCases
  module V1
    module Organisations
      module Update

        class Base < UseCases::Base
          depends Show::FindOrganisation,
                  AssignAttributes,
                  Validate,
                  Save

          def final
            authorize :organisation

            context.data = context.error_response

            return unless context.ok?

            context.data = context.user
          end
        end

      end
    end
  end
end
