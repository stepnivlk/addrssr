module UseCases
  module V1
    module Organisations
      module Index

        class Base < UseCases::Base
          depends FindOrganisations

          def final
            context.data = context.error_response

            return unless context.ok?

            context.data = context.organisations
          end
        end

      end
    end
  end
end
