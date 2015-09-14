Rails.configuration.stripe = {
  :publishable_key => 'pk_test_o9EQPVcZHcaEp9H2UZFOfdzX',
  :secret_key      => 'sk_test_t6MqjtXKYqszE8S5novPJDXN'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]