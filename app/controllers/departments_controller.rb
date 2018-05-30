class DepartmentsController < ApplicationController
  skip_before_action only: [:index, :show]
  before_action :set_department, only: [:show, :update, :edit, :destroy]
  
  
    def index
      @departments = Department.all
    end
  
    def show
      # we have @department already because we already called it in the before action
    end
  
    def new
      @department = Department.new
      render :form
    end
  
    def edit
      render :form
    end
  
    def create
      @department = Department.new(department_params)
      if @department.save
        redirect_to @department
      else
        render :form
      end
    end
  
    def update
      if @department.update(department_params)
        redirect_to @department
      else
        render :form
      end
    end
  
    def destroy
      @department.destroy
      redirect_to department_path
    end
  
    private
    def set_department
      @department = Department.find(params[:id])
    end
  
    def department_params
      params.require(:department).permit(:name)
    end
  end