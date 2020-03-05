class WelcomeController < ApplicationController
  def index
  end

  def create
    Rails.logger.info notify_params
    Rails.logger.info params
    AlertReceiver.find_or_create_by!(browser_id: notify_params[:browser_id])

    render json: { message: 'Thanks for subscribing!'}, status: :ok
  rescue => error
    Rails.logger.error(error.message)
    Rails.logger.error(error.backtrace.join('\n'))
    render json: { message: 'Unable to proceed. Please contact support!'}, status: :forbidden
  end

  def firebase_messaging_sw
    respond_to do |f|
        f.js { render layout: false, content_type: 'text/javascript' }
      end
  end

  private

  def notify_params
    params.permit(:browser_id)
  end
end
