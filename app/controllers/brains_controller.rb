class BrainsController < ApplicationController


  def index
    @brains = Brain.all
  end

  def seed
    brains = Brain.new
    brains.seed
    # RAKE::Task["db:seed"]
    redirect_to root_path
  end
end