class CheckoutController < ApplicationController

	def create
		product = Product.find(params[:id])
		product.update(sales_count: product.sales_count+1)
		begin
			@session = Stripe::Checkout::Session.create({
			  payment_method_types: ['card'],
			  line_items: [ {
	      price_data: {
	        currency: 'inr',
	        product_data: {
	          name: product.name,
	        },
	        unit_amount: product.price, # Amount in cents (e.g., $10.00)
	      },
	      quantity: 1,
	    },
			],
			  mode: 'payment',
			  success_url: root_url(success: true),
			  cancel_url: root_url,
			})
			redirect_to @session.url, allow_other_host: true
		rescue Stripe::StripeError => e
    	puts "Please Connect Your internet connection"
	  	# respond_to do |format|
	    #   # format.html # Default HTML format
	    #   format.js   # JavaScript format
	 
	    
	   end
	end
end
