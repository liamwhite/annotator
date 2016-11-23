# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class UpdaterChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def update(data)
    chapter = Chapter.find(data['chapterId'])
    model = data['class'].capitalize.constantize.find_or_initialize_by(chapter: chapter, line: data['number'])
    model.note = data['text']
    model.save
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
