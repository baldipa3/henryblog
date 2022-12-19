class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @enquiry = Enquiry.find(enquiry_params[:id])
  end

  def create
    response = Response.new(response_params)
    if response.save
      redirect_to enquiries_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def response_params
    params.require(:response).permit(:answer, :enquiry_id).to_h.merge(user_id: current_user.id)
  end

  def enquiry_params
    params.permit(:id)
  end
end
