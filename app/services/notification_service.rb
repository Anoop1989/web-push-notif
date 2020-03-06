class NotificationService
  def initialize(feed, recepient_ids, icon_url)
    @feed = feed.is_a?(String) ? JSON.parse(feed) : feed
    @service_name = "fcm"
    @recepient_ids = recepient_ids
    @icon_url = icon_url
  end

  def deliver!
    response = self.send("send_#{@service_name}_message")
  end

  private
  def send_fcm_message
    fcm = FCM.new(construct_fcm_config['server_key'])
    registration_ids = @recepient_ids

    fcm.send(registration_ids, construct_fcm_config['message'])
  end

  def construct_fcm_config
    {
      server_key: 'AAAA_ORN5d0:APA91bHOy31E4ggEHBUwDX5UieevNSUD-YMn3UqG7EQh0HvzKKC9qAzktTrV4OCCdfwWdq2cgPSrg05xMXIf5bGkoG2m_NJzrB6KzixBq9y5roJCdgE9edZ-HpexavYBah6X0xw8uI-d',
      message: {
        notification: {
          title: @feed['title'],
          body: @feed['body'],
          click_action: @feed['url'] || "http://localhost:8000/",
          icon: @icon_url,
          # action: [{action: "Yes", title: "Yes"}, {action: "No", title: "No"}]
        }
      }
    }.with_indifferent_access
  end
end
