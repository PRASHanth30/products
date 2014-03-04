class ProdctController < ApplicationController
  

   def destroy
     @prodct = Prodct.find(params[:id])
     @prodct.destroy

      redirect_to :action => 'list'
   end
  def list
    @prodcts = Prodct.find(:all)
    
	prodct_ids = Prodct.find( :all, :select => 'id' ).map( &:id )
@prdcts = Prodct.find( (1..4).map { prodct_ids.delete_at( prodct_ids.size * rand ) } )
	
	
   end
   def show
   @prodct = Prodct.find(params[:id])
   end
   def new
     @prodct = Prodct.new
   end
   def create
      @prodct = Prodct.new(prodct_params)
      if @prodct.save
            redirect_to :action => 'list'
      else
           
            render :action => 'new'
      end
   end
   def edit
      @prodct = Prodct.find(params[:id])
   end
   def update
       @prodct = Prodct.find(params[:id])
     if @prodct.update_attributes(prodct_params)
         redirect_to :action => 'show', :id => @prodct
      else
        
         render :action => 'edit'
      end
   end
  
   private
  def prodct_params
    params.require(:prodct).permit(:name, :description, :imgurl, :price, :availability)
  end
end
