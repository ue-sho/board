class BoardsController < ApplicationController # コントローラーの継承はApplicationContorollerにする
  
  before_action :set_target_board, only: %i[show edit update destroy] # 各アクションが行われる前に実行される
  
  def index
    @boards = Board.page(params[:page]) # デフォルトは２５件のデータを取得する（ページごと）　kaminariの機能
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "#{board.title} の掲示板を作成しました" # フラッシュ変数　次に参照されるまで保存される
      redirect_to board # idに対応したURLにリダイレクトをしてくれる
    else  
      redirect_to new_board_path, flash: {
        board: board,  # 失敗したら保存しておいて、もう一度newメソッドが呼ばれる時にデータが保存されている状態を作る
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    # @comment = @board.comments.new  保存されていないコメントが代入されてしまう
    @comment = Comment.new(board_id: @board.id)  # これなら保存されたやつになる
  end

  def edit
  end

  def update
    if @board.update(board_params)
      flash[:notice] = "#{@board.title} の掲示板を更新しました" 
      redirect_to @board # リダイレクト
    else  
      redirect_to new_board_path, flash: {
        board: @board,  # 失敗したら保存する
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    @board.delete

    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" } # リダイレクトでフラッシュする方法
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end