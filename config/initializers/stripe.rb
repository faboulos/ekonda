Rails.configuration.stripe = {

    :publishable_key => 'pk_test_8gxzt7G69zlvLnrAzV1Hcc9S',
    :secret_key => 'sk_test_yFNjs07WGj8OmQPFFAcd6yVx'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]