module UseCases
  module V1
    module Organisations
      module Index

        class FindOrganisations < UseCases::Base
          def perform
            context.organisations = Organisation.unscoped
          end
        end

      end
    end
  end
end
