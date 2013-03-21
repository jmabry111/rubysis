class GuardianshipsController < ApplicationController
  
  
  private
  
  def guardianship_params
    params.require(:guardianship).permit(:parent_id, :student_id)
  end
end