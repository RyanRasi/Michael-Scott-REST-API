module Api
    module V1
        class QuotesController < ApplicationController

            def index
                quotes = Quote.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded quotes', data:quotes},status: :ok
            end
            
            def show
                quote = Quote.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded quote', data:quote},status: :ok
            end

            def create
                quote = Quote.new(quote_params)

                if quote.save
                    render json: {status: 'SUCCESS', message:'Saved quote', data:quote},status: :ok
                else
                    render json: {status: 'ERROR', message:'Quote not saved', data:quote.errors},status: :unprocessable_entity
                end
            end

            def destroy
                quote = Quote.find(params[:id])
                quote.destroy
                render json: {status: 'SUCCESS', message:'Deleted quote', data:quote},status: :ok
            end

            def update
                quote = Quote.find(params[:id])
                if quote.update_attributes(quote_params)
                    render json: {status: 'SUCCESS', message:'Updated quote', data:quotes},status: :ok
                else
                    render json: {status: 'ERROR', message:'Quote not updated', data:quote.errors},status: :unprocessable_entity
                end
            end
            
            private

            def quote_params
                params.permit(:title, :body)
            end
        end
    end
end