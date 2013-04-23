class BenhnhansController < ApplicationController
  def index
    @benhnhans_paging = Benhnhan.page(params[:page]).per(10)
    @benhnhans = @benhnhans_paging.order(sort_column + ' ' + sort_direction).search(params[:search])
    
    if !session[:language]
      session[:language]= "en"     
    elsif params[:language]
      session[:language] = params[:language]
    end 
  end

  def create
    @benhnhans=Benhnhan.new(params[:benhnhan])
    @benhnhans.save
    redirect_to "/"
  end

  def new
    @benhnhan=Benhnhan.new
  end

  def delete
    @benhnhan=Benhnhan.find(params[:id])
    @benhnhan.destroy
    redirect_to"/"
  end
  
  def edit
    @benhnhan = Benhnhan.find(params[:id])  
  end

  def update
     @benhnhan = Benhnhan.find(params[:id])
    respond_to do |format|
      if @benhnhan.update_attributes(params[:benhnhan])
        format.html { redirect_to "/", notice: 'Thong tin da cap nhap' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end
 
  
   private
  def sort_column
    params[:sort] || "ten_benh_nhan"
  end
  
  def sort_direction
    params[:direction] || "asc"
  end
  
  
  
end
