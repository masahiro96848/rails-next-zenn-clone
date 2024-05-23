# frozen_string_literal: true

# ApplicationMailer is the base mailer class from which all mailers inherit.
# It sets default configurations and layout for all mailers.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
