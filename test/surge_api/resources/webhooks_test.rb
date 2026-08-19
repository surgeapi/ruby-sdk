# frozen_string_literal: true

require_relative "../test_helper"

class SurgeAPI::Test::Resources::WebhooksTest < SurgeAPI::Test::ResourceTest
  def test_unwrap
    key = "whsec_c2VjcmV0Cg=="

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"account_id\":\"acct_01japd271aeatb7txrzr2xj8sg\",\"data\":{\"id\":\"call_01jjnn7s0zfx5tdcsxjfy93et2\",\"contact\":{\"id\":\"ctc_01ja88cboqffhswjx8zbak3ykk\",\"phone_number\":\"+18015551234\",\"email\":\"dom@toretto.family\",\"first_name\":\"Dominic\",\"last_name\":\"Toretto\",\"metadata\":{\"car\":\"1970 Dodge Charger R/T\"},\"outbound_disabled\":false},\"duration\":184,\"initiated_at\":\"2025-03-31T21:01:37Z\",\"status\":\"completed\",\"from\":\"+18015551234\",\"phone_number_id\":\"pn_01jsjwe4d9fx3tpymgtg958d9w\",\"to\":\"+18015556789\"},\"timestamp\":\"2024-10-21T23:29:41Z\",\"type\":\"call.ended\"}"
    message_id = "1"
    timestamp = Time.now.to_i.to_s
    signature = webhook.sign(message_id, timestamp, data)
    headers =
      {"webhook-id" => message_id, "webhook-timestamp" => timestamp, "webhook-signature" => signature}

    @surge.webhooks.unwrap(data, headers: headers, key: key)

    bad_headers = [
      headers.merge("webhook-id" => "bad"),
      headers.merge("webhook-timestamp" => "0"),
      headers.merge("webhook-signature" => webhook.sign(message_id, timestamp, "xxx"))
    ]
    bad_headers.each do |bad_header|
      assert_raises(StandardWebhooks::WebhookVerificationError) do
        @surge.webhooks.unwrap(data, headers: bad_header, key: key)
      end
    end
  end
end
