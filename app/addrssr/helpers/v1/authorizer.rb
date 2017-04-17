module Helpers
  module V1

    class Authorizer
      attr_reader :status, :message

      def initialize
        @status = :ok
      end

      def authorize(current_user, entities)
        @current_user = current_user
        @entities = entities

        judge
      end

      def ok?
        @status == :ok
      end

      protected

      def judge
        return if @current_user.admin?

        @entities.each { |entity| send(entity.class.name.downcase, entity) }
      end

      private

      def user(user)
        return if user == @current_user

        failure('you dont have rights for this user')
      end

      def organisation(organisation)
        return if organisation.id == @current_user.organisation_id

        failure('you dont have rights for this organisation')
      end

      def contact(contact)
        p "contact"
      end

      def failure(message)
        @message = message
        @status = :unprocessable_entity
      end
    end

  end
end
