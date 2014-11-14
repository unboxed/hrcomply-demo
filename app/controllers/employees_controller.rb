class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to :employees, notice: 'Employee was successfully created.'
    else
      flash.now[:alert] = 'Employee could not be created - please check any errors and try again.'
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to :employees, notice: 'Employee was successfully updated.'
    else
      flash.now[:alert] = 'Employee could not be updated - please check any errors and try again.'
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully deleted.'
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :title, :notes)
    end
end
