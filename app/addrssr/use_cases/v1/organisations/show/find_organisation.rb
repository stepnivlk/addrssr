module UseCases
  module V1
    module Organisations
      module Show

        class FindOrganisation < UseCases::Base
          required_context :organisation_id

          def perform
            get_organisation

            failure!(:not_found, 'Organisation not found for given id') \
              unless context.organisation
          end

          private

          def get_organisation
            context.organisation = Organisation.find_by(id: organisation_id)
          end
        end

      end
    end
  end
end
