class TimeBlocksController < ApplicationController
  
  
  def time_blocks_params
    params.require(:time_block).permit(:block)
  end
end