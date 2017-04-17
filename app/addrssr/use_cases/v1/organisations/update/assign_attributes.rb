module UseCases
  module V1
    module Organisations
      module Update

        class AssignAttributes < UseCases::Base
          required_context :organisation

          def perform
            organisation.assign_attributes organisation_attributes
          end

          private

          def organisation_attributes
            (context.organisation_attributes || {}).with_indifferent_access.slice \
              :name
          end
        end

      end
    end
  end
end
