module Api
  module V1

    class UsersController < ApplicationController
      before_action :authenticate_user

      def index
        context = UseCases::V1::Users::Index::Base.perform \
          current_user:    current_user,
          organisation_id: params[:organisation_id]

        render json: context.data, status: context.http_status
      end

      def show
        context = UseCases::V1::Users::Show::Base.perform \
          current_user:    current_user,
          user_id:         params[:id],
          organisation_id: params[:organisation_id]

        render json: context.data, status: context.http_status
      end

      def create
      end

      def update
        context = UseCases::V1::Users::Update::Base.perform \
          current_user:    current_user,
          user_id:         params[:id],
          organisation_id: params[:organisation_id],
          user_attributes: user_params

        render json: context.data, status: context.http_status
      end

      def destroy
      end

      protected

      def user_params
        params.require(:user).permit!
      end
    end

  end
end
