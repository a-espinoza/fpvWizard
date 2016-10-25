class RaceController < ActionController::Base

  def race

  end

  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new
  end

  def polarization

  end

  def create
    @race = Race.create(race_params)
    redirect_to root_path
  end

    def edit
      @race = Race.find(params[:id])
    end

    def update
      if @race.update(race_params)
        flash[:success] = "Hoorayy! Your race has been updated."
        redirect_to races_path
      else
        flash.now[:alert] = "Ohh no!! Update failed.  But go ahead and try again!"
        render :edit
      end
    end

      def destroy
        @race = Race.find(params[:id])
        @race.destroy
        redirect_to root_path
      end

      private
      def race_params
        params.require(:race).permit(:name, :last_name, :polarization)
      end
    end
