class WelcomeController < ApplicationController
  def index
  end

  def create
    AlertReceiver.find_or_create_by!(browser_id: notify_params[:browser_id])

    render json: { message: 'Thanks for subscribing!'}, status: :ok
  rescue => error
    Rails.logger.error(error.message)
    Rails.logger.error(error.backtrace.join('\n'))
    render json: { message: 'Unable to proceed. Please contact support!'}, status: :forbidden
  end

  private

  def notify_params
    params.permit(:browser_id)
  end
end
