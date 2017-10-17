class CommentsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @job= Job.find(params[:job_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    @comment.save

    redirect_to company_job_comment_path(@company, @job, @comment.job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
