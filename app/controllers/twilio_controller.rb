require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_action :set_header
  skip_before_action :verify_authenticity_token

  def sms
    IncomingSmsHandlingWorker.perform_later(params)

    response = Twilio::TwiML::Response.new do |r|
      r.message('Hello World!')
    end

    render_twiml response
  end
end
