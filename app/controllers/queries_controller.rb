class QueriesController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy, :assign, :respond, :close, :cancel]
  before_action :set_queryable, only: [:new, :create]

  def index
    @queries = Query.includes(:queryable, :assigned_to, :created_by)
                   .recent
                   .page(params[:page])
    
    # Filter by status if specified
    @queries = @queries.where(status: params[:status]) if params[:status].present?
    
    # Filter by priority if specified  
    @queries = @queries.where(priority: params[:priority]) if params[:priority].present?
    
    # Filter by assigned user if specified
    @queries = @queries.where(assigned_to: params[:assigned_to_id]) if params[:assigned_to_id].present?
  end

  def show
  end

  def new
    @query = @queryable.queries.build if @queryable
    @query ||= Query.new
  end

  def create
    @query = @queryable ? @queryable.queries.build(query_params) : Query.new(query_params)
    @query.created_by = current_user if respond_to?(:current_user)

    if @query.save
      redirect_to @query, notice: 'Query was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @query.update(query_params)
      redirect_to @query, notice: 'Query was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @query.destroy
    redirect_to queries_url, notice: 'Query was successfully deleted.'
  end

  def assign
    if @query.update(assigned_to_id: params[:assigned_to_id])
      redirect_to @query, notice: 'Query was successfully assigned.'
    else
      redirect_to @query, alert: 'Failed to assign query.'
    end
  end

  def respond
    if @query.update(response: params[:response], status: 'answered')
      redirect_to @query, notice: 'Response submitted successfully.'
    else
      redirect_to @query, alert: 'Failed to submit response.'
    end
  end

  def close
    if @query.update(status: 'closed')
      redirect_to @query, notice: 'Query was successfully closed.'
    else
      redirect_to @query, alert: 'Failed to close query.'
    end
  end

  def cancel
    if @query.update(status: 'cancelled')
      redirect_to @query, notice: 'Query was successfully cancelled.'
    else
      redirect_to @query, alert: 'Failed to cancel query.'
    end
  end

  private

  def set_query
    @query = Query.find(params[:id])
  end

  def set_queryable
    if params[:queryable_type].present? && params[:queryable_id].present?
      @queryable = params[:queryable_type].constantize.find(params[:queryable_id])
    end
  end

  def query_params
    params.require(:query).permit(
      :title, :description, :query_type, :priority, :field_name, 
      :expected_value, :due_date, :assigned_to_id, :response
    )
  end
end
