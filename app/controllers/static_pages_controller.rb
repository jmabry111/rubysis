class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_admin!
end
