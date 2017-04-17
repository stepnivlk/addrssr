module UseCases
  module V1
    module Organisations
      module Show

        class Base < UseCases::Base
          depends FindOrganisation

          def final
            authorize :organisation

            context.data = context.error_response

            return unless context.ok?

            context.data = context.organisation
          end
        end

      end
    end
  end
end
