class BoardsController < ApplicationController
  before_action :set_article

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new 
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board), notice: '保存に成功'
    else
      flash.now[:error] = '保存に失敗'
      render :new
      # creare action中でnew.htmlを表示させている
    end
  end

  def edit
    # new actionとの違い => editはidが渡ってくる
  end

  private
    def board_params
      params.require(:board).permit(:title, :name, :content)
    end

    def set_article
      @board = Board.find(params[:id])
    end

end