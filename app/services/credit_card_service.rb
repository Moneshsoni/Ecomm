class CreditCardService
  def initialize(user_id, card)
    @user = User.find(user_id)
    @card = card
  end
 
  def create_credit_card
    binding.pry
    customer = Stripe::Customer.create({
      email: current_user.email,
      description: "Customer for subscription",
      payment_method: params[:payment_method],
      invoice_settings: {
        default_payment_method: params[:payment_method] 
      } 
    })
    # customer_id = @user.id
    customer = Stripe::Customer.retrieve(customer_id)
    customer.sources.create(source: generate_token).id
  end
 
  def generate_token
    Stripe::Token.create(
      card: {
        number: @card[:number],
        exp_month: @card[:month],
        exp_year: @card[:year],
        cvc: @card[:cvc]
      }
    ).id
  end
end
