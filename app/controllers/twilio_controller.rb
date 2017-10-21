require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_action :set_header
  skip_before_action :verify_authenticity_token

  def sms
    IncomingSmsHandlingWorker.perform_async(mobile_phone_number, body)

    response = Twilio::TwiML::Response.new do |r|
      r.message('Message bien reçu, merci.')
    end

    render_twiml response
  end


  private

  def mobile_phone_number
    params["From"]
  end

  def body
    params["Body"]
  end
end
