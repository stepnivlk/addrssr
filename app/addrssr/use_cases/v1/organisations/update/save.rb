module UseCases
  module V1
    module Organisation
      module Update

        class Save < UseCases::Base
          required_context :organisation

          def perform
            return if organisation.save

            failure!(:unprocessable_entity, "could not save the organisation")
          end
        end

      end
    end
  end
end
