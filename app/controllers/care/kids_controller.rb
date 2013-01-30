class Care::KidsController < Care::CareController

  def show
    @kid = Kid.find(params[:id])
  end

end
