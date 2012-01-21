

class PlayersController < ApplicationController
  # GET /players
  # GET /players.xml
  
  require_role "ADMIN", :for_all_except => [:index, :show]
  
  
  require 'gchart'
  
  def index
     unsortedplayers = Player.all
    # @players = unsortedplayers.sort{ |a,b | b.net_result <=> a.net_result}
      if params[:sort] == 'points'
         @players = unsortedplayers.sort{ |a,b | b.points <=> a.points}
       elsif params[:sort] == 'score'
         @players = unsortedplayers.sort{ |a,b | b.score <=> a.score}
       elsif params[:sort] == 'scorept'
         @players = unsortedplayers.sort{ |a,b | b.rel_score <=> a.rel_score}
       elsif params[:sort] == 'netpt'
         @players = unsortedplayers.sort{ |a,b | b.rel_net_result <=> a.rel_net_result}
       elsif params[:sort] == 'name'
         @players = unsortedplayers.sort{ |a,b | a.name <=> b.name}
       elsif params[:sort] == 'rebuys'
         @players = unsortedplayers.sort{ |a,b | b.rebuys <=> a.rebuys}
       elsif params[:sort] == 'tournaments'
         @players = unsortedplayers.sort{ |a,b | b.participations.size <=> a.participations.size}
       else
         @players = unsortedplayers.sort{ |a,b | b.net_result <=> a.net_result}
       end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @players }
    end
  end
  
  def ranking
    unsortedplayers = Player.all
    if params[:sort] == 'points'
      @players = unsortedplayers.sort{ |a,b | a.points <=> b.points}
    else
      @players = unsortedplayers.sort{ |a,b | a.net_result <=> b.net_result}
    end
  end

  # GET /players/1
  # GET /players/1.xml
  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/new
  # GET /players/new.xml
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.xml
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        flash[:notice] = 'Player was successfully created.'
        format.html { redirect_to(@player) }
        format.xml  { render :xml => @player, :status => :created, :location => @player }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.xml
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        flash[:notice] = 'Player was successfully updated.'
        format.html { redirect_to(@player) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.xml
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to(players_url) }
      format.xml  { head :ok }
    end
  end
end
