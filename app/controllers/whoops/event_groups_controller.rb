module Whoops
  class EventGroupsController < ApplicationController
    before_filter :update_event_group_filter
    helper_method :event_group_filter

    def index
      finder = if params[:query].blank?
        EventGroup.where(event_group_filter.to_query_document)
      else
        EventGroup.where(:_id.in => Event.where(:keywords => /#{params[:query]}/i).collect{|e| e.event_group_id}.uniq)
      end

      @event_groups = finder.desc(:last_recorded_at).page(params[:page]).per(30)

      respond_to do |format|
        format.html
        format.js { render :partial => 'list' }
      end
    end

    def show
      @event_group = EventGroup.find(params[:id])
    end

    def update_event_group_filter
      self.event_group_filter = params[:whoops_filter] if params[:updating_filters]
    end

    def event_group_filter
      session[:event_group_filter] ||= Filter.new
    end

    def event_group_filter=(filter)
      session[:event_group_filter] = Filter.new_from_params(filter)
    end

  end
end
