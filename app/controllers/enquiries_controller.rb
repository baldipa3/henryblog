class EnquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @enquiries = Enquiry.all
  end

  def new
    @enquiry = Enquiry.new
  end

  def create
    enquiry = Enquiry.new(enquiry_params)
    if enquiry.save
      redirect_to enquiries_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def enquiry_params
    params.require(:enquiry).permit(:question).to_h.merge(user_id: current_user.id)
  end
end

