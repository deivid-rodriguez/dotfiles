# frozen_string_literal: true
#
# Main base mailer class
#
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
