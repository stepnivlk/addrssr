module UseCases

  class Base < RestMyCase::Base

    include RestMyCase::HttpStatus

    protected

    def authorize(*entities)
      entities = entities.map { |entity| context.send(entity) }.compact
      authorizer.authorize(context.current_user, entities)
      return if authorizer.ok?

      failure(authorizer.status, authorizer.message)
    end

    def authorizer
      @authorizer ||= Helpers::V1::Authorizer.new
    end

  end

end
