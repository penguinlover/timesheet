require 'model_ext'
class ProjectsController < ApplicationController
  is_custom_object true
  respond_to :json, :html

  # Also query notes from the project
  def index
    @projects = Project.all

    Project.send(:include, ModelExtension::ProjectExtension)

    # Project.class_eval do
    #   def project_member
    #     [{ :project_member => { :Name__c => 'Doe Jones',     :Total_Hour_Worked__c => 32 }},
    #      { :project_member => { :Name__c => 'Mark Blackman', :Total_Hour_Worked__c => 24 }}]
    #   end
    # end

    # response = JSON.parse Project.client.http_get("/services/data/v25.0/query", :q => "SELECT #{Project.field_list} FROM Project__c").body
    # render :text => pp_yaml(response.to_yaml) + '******** Description *********' + pp_yaml(Project.description.to_yaml)   
    # render :text => pp_yaml(Project.attributes.to_yaml)
    respond_with @projects
  end

  def show
    @project = Project.find params[:id]
    # @project.project_manager
    # @project.project_members
    respond_with @project
  end

  def new
    @project = Project.new
    #render :text => pp_yaml(@project.to_yaml) 
  end

  def create
    project = Project.create(Project.coerce_params(params[:project]))
    redirect_to project_path(project)
  end

  def search
    @projects = Project.query "Name__c LIKE '%#{params[:qry]}%'"
    render :index
  end
end







