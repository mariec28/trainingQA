class EmployeesController < ApplicationController
  before_action :set_employee, only: [ :show, :edit, :update, :destroy ]
  
  #List of employees
  def index 
    @employees = Employee.all
  end

  #Detail employee
  def show    
  end

  #New employee
  def new
    @employee = Employee.new
  end

  #Edit employee
  def edit
  end

  #Delete employee
  def destroy
    @employee.destroy

    #Redirect to
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
    end
  end

  #create method
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_path, notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portafolio.errors, status: :unprocessable_entity }
      end
    end
  end

  #update method
  def update
    respond_to do |format|
        if @employee.update(employee_params)
          format.html { redirect_to employees_path, notice: "Employee was successfully updated." }
          format.json { render :show, status: :ok, location: @employee }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render :show, status: :unprocessable_entity, location: @employee }
        end
    end
  end

  private 
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name,
                                       :last_name,
                                       :address,
                                       :phone,
                                       :salary
                                       )
    end
end
