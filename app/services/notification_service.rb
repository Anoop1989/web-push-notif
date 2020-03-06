class NotificationService
  def initialize(feed, recepient_ids)
    @feed = feed
    @service_name = "fcm"
    @recepient_ids = recepient_ids
  end

  def deliver!
    response = self.send("send_#{@service_name}_message")
  end

  private
  def send_fcm_message
    fcm = FCM.new(construct_fcm_config['server_key'])
    registration_ids = @recepient_ids || ['dfLctyPLTEVqEVl3xBUa9B:APA91bG8uhHcIsOOn1LbdIJkw98S4y1whgbCCJv4XcDDmEINL6I4oMgX9ytvQwWs9ivr4cKXndvmnYaiEqnlJTetJcpfrxeKFxU7hXaoPqfo2PdZCXFImKxaLmfSFVcQQ92voa0SqPZ7', 'fK2wTsbnssDaiL66PK_PiE:APA91bGye7rjzny7RKnkczFeWk6FgxjA0Ns2MWt1RvcWs5soTx6VfjzSIrjpIKyIEixBB7GzEZXDT6MFjFJj_7bXOQ-0BeLoxmrgLW_zRmlNcz3BzpvFZxflJg_tWcNu2gfRjm0ro9kA']

    response = fcm.send(registration_ids, construct_fcm_config['message'])
  end

  def construct_fcm_config
    {
      server_key: 'AAAA_ORN5d0:APA91bHOy31E4ggEHBUwDX5UieevNSUD-YMn3UqG7EQh0HvzKKC9qAzktTrV4OCCdfwWdq2cgPSrg05xMXIf5bGkoG2m_NJzrB6KzixBq9y5roJCdgE9edZ-HpexavYBah6X0xw8uI-d',
      message: {
        notification: {
          title: @feed.title,
          body: @feed.body,
          click_action: @feed.url || "http://localhost:8000/",
        }
      }
    }.with_indifferent_access
  end
end
