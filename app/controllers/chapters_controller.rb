class ChaptersController < ApplicationController

  def show
    @chapter = Chapter.find(params[:id])
    @annotations = @chapter.annotations.map{ |ann| [ann.line, ann.note] }.to_h
    @summaries = @chapter.summaries.map { |sum| [sum.line, sum.note] }.to_h
  end

end
