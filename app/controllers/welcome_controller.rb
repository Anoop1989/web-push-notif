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

<<<<<<< HEAD
  def demo
  end

  def landing
  end

  def homepage
=======
  def firebase_messaging_sw
    respond_to do |f|
        f.js { render layout: false, content_type: 'text/javascript' }
      end
  end

  def message_send
    NotificationService.new(message_send_params[:content], [message_send_params[:browser_id]], icon_url).deliver!
    render json: {body: 'message sent'}, status: :ok
  rescue => error
    Rails.logger.error(error.message)
    Rails.logger.error(error.backtrace.join('\n'))
    render json: { message: 'Unable to proceed. Please contact support!'}, status: :forbidden
>>>>>>> 9e08e6449c0045c7f1cc2bc0177da5411dc1b818
  end

  private

  def notify_params
    params.permit(:browser_id)
  end

  def message_send_params
    params.permit({:content => [:title, :body, :url, :icon]}, :browser_id, :add_icon)
  end

  def icon_url
    message_send_params[:add_icon].to_s == "true" ?
      "#{request.protocol}#{request.host_with_port}/assets/flying-bird.png" :
      ""
  end
end
