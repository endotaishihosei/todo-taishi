class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
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
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  # def update
  #   @board = Board.find(params[:id])
  #   if @board.update(board_params)
  #     redirect_to board_path, notice: '変更に成功'
  #   else
  #     flash.now[:error] = '保存に失敗しました'
  #     render :edit
  #   end
  # end

  private
    def board_params
      params.require(:board).permit(:title, :name, :content)
    end

    def set_board
      @board = Board.find(params[:id])
    end

end