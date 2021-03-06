class InfoController < ApplicationController
	def home
		# For web contact
		@contact = Contact.new
    @products = Product.all
		@projects = Project.all.order(complete_date: :desc)
	end

	# POST Contact
	def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
    	redirect_to :home
    else
      flash[:alert] = 'Cannot send message.'
      redirect_to :home
    end
  end
end
