Rails.configuration.stripe = {
  :publishable_key => 'sk_test_51NiXaFSG6XaJeVCma8J3SnInSJ3mBvr4LzeTOQGyhRy163yJWzeoc8bmhdbVXQQVLjb3Us0lsnjsXc6x0YxNbruU00yZwa3fYH',
  :secret_key      => 'pk_test_51NiXaFSG6XaJeVCmKqSqlGA6Bbg7K0pihFc8McGl955BRHHdVOLZhZmojgHFKm46ojU04CKgjQEviT37IuCr8sxs00LAXKtIoJ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
 
StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded' do |event|
    # Here you can send notification to user,
    # change transaction state or whatever you want.
  end
end