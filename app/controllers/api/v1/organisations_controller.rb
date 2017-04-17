module Api
  module V1

    class OrganisationsController < ApplicationController
      before_action :authenticate_user

      def index
        context = UseCases::V1::Organisations::Index::Base.perform \
          current_user: current_user

        render json: context.data, status: context.http_status
      end

      def show
        context = UseCases::V1::Organisations::Show::Base.perform \
          current_user:    current_user,
          organisation_id: params[:id]

        render json: context.data, status: context.http_status
      end

      def create
      end

      def update
        context = UseCases::V1::Organisations::Update::Base.perform \
          current_user:            current_user,
          organisation_id:         params[:id],
          organisation_attributes: organisation_params

        render json: context.data, status: context.http_status
      end

      protected

      def organisation_params
        params.require(:organisation).permit!
      end
    end

  end
end
