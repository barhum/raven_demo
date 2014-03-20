class RavensController < ApplicationController
  def index
    if(params[:operation] && params[:amount] && params[:prn] && params[:currency] && params[:cardNumber] && params[:pymtType] && params[:expiryMonth] && params[:expiryYear])
      @raven = Raven::RavenRequest.new(params[:operation])
      @raven.set('Amount', params[:amount])
      @raven.set('PRN', params[:prn])
      @raven.set('Currency', params[:currency])
      @raven.set('CardNumber', params[:cardNumber])
      @raven.set('PymtType', params[:pymtType])
      @raven.set('ExpiryDate', (params[:expiryMonth] + params[:expiryYear]))
      @response = @raven.send
    end  
  end
end


# <!-- pymtReq = Raven.RavenRequest('submit')
# pymtReq.set('PRN', '847995')
# pymtReq.set('Currency', 'USD')
# pymtReq.set('CardNumber', '4242424242424242')
# pymtReq.set('PymtType', 'cc_debit')
# pymtReq.set('ExpiryDate', '0919')
# pymtReq.set('Amount', 4321) -->