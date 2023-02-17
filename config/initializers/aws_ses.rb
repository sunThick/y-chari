unless Rails.env.development? || Rails.env.test?
  creds = Aws::Credentials.new(
    Rails.application.credentials.aws_ses.fetch(:access_key_id),
    Rails.application.credentials.aws_ses.fetch(:secret_access_key)
  )
  Aws::Rails.add_action_mailer_delivery_method(:ses, credentials: creds, region: 'ap-northeast-1')
end
