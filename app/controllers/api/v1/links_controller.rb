module Api
  module V1
    class LinksController < ApplicationController
      def create
        link = Link.new(link_params)

        if link.save
          json_response(LinkSerializer.new(link), :created)
        else
          json_response({ errors: link.errors }, :unprocessable_entity)
        end
      end

      def show
        link = Link.find_by_slug(params[:slug])

        if link
          json_response(LinkSerializer.new(link))
        else
          json_response({ errors: { link: 'Link Not Found.' } }, :not_found)
        end
      end

      private

      def link_params
        params.require(:link).permit(:long_url, :slug)
      end
    end
  end
end
