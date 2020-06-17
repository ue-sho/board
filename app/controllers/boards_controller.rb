class BoardsController < ApplicationController # コントローラーの継承はApplicationContorollerにする
  
  before_action :set_target_board, only: %i[show edit update destroy] # 各アクションが行われる前に実行される
  
  def index
    @boards = Board.page(params[:page]) # デフォルトは２５件のデータを取得する（ページごと）　kaminariの機能
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    redirect_to board # idに対応したURLにリダイレクトをしてくれる
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)

    redirect_to @board # リダイレクト
  end

  def destroy
    @board.delete

    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end