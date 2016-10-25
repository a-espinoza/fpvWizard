class PilotsController < ActionController::Base

  def pilot

  end

  def index
    @pilots = Pilot.all
  end

  def show
    @pilot = Pilot.find(params[:id])
  end

  def new
    @pilot = Pilot.new
  end

  def polarization

  end

  def create
    @pilot = Pilot.create(pilot_params)
    redirect_to root_path
  end

    def edit
      @pilot = Pilot.find(params[:id])
    end

    def update
      if @pilot.update(pilot_params)
        flash[:success] = "Hoorayy! Your pilot has been updated."
        redirect_to pilots_path
      else
        flash.now[:alert] = "Ohh no!! Update failed.  But go ahead and try again!"
        render :edit
      end
    end

      def destroy
        @pilot = Pilot.find(params[:id])
        @pilot.destroy
        redirect_to root_path
      end

      private
      def pilot_params
        params.require(:pilot).permit(:name, :last_name, :polarization)
      end
    end
