class CreditCardsController < InheritedResources::Base

  private

    def credit_card_params
      params.require(:credit_card).permit(:digits, :month, :year, :user_id)
    end

end
