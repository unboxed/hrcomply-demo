require 'rails_helper'

RSpec.describe EmployeesController, :type => :controller do
  let(:valid_attributes) do
    {name: 'Andrew White', title: 'CTO', notes: 'Rails Core Team member'}
  end

  let(:invalid_attributes) do
    {name: '', title: '', notes: ''}
  end

  let(:valid_session) do
    {}
  end

  describe "GET index" do
    let! :employee do
      employee = Employee.create! valid_attributes
    end

    before do
      get :index, {}, valid_session
    end

    it "assigns all employees as @employees" do
      expect(assigns(:employees)).to eq([employee])
    end
  end

  describe "GET new" do
    let! :employee do
      employee = Employee.create! valid_attributes
    end

    before do
      get :new, {}, valid_session
    end

    it "assigns a new employee as @employee" do
      get :new, {}, valid_session
      expect(assigns(:employee)).to be_a_new(Employee)
    end
  end

  describe "GET edit" do
    let! :employee do
      employee = Employee.create! valid_attributes
    end

    before do
      get :edit, {:id => employee.to_param}, valid_session
    end

    it "assigns the requested employee as @employee" do
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, {:employee => valid_attributes}, valid_session
        }.to change(Employee, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, {:employee => valid_attributes}, valid_session
        expect(assigns(:employee)).to be_an(Employee)
        expect(assigns(:employee)).to be_persisted
      end

      it "redirects to the employees page" do
        post :create, {:employee => valid_attributes}, valid_session
        expect(response).to redirect_to(employees_url)
      end
    end

    describe "with invalid params" do
      before do
        post :create, {:employee => invalid_attributes}, valid_session
      end

      it "assigns a newly created but unsaved employee as @employee" do
        expect(assigns(:employee)).to be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    let! :employee do
      Employee.create! valid_attributes
    end

    describe "with valid params" do
      let(:new_attributes) do
        {name: 'Richard Stobart', title: 'CEO', notes: ''}
      end

      before do
        put :update, {:id => employee.to_param, :employee => new_attributes}, valid_session
        employee.reload
      end

      it "assigns the requested employee as @employee" do
        expect(assigns(:employee)).to eq(employee)
      end

      it "updates the requested employee" do
        expect(employee.name).to eq('Richard Stobart')
        expect(employee.title).to eq('CEO')
        expect(employee.notes).to be_empty
      end

      it "redirects to the employees page" do
        expect(response).to redirect_to(employees_url)
      end
    end

    describe "with invalid params" do
      before do
        put :update, {:id => employee.to_param, :employee => invalid_attributes}, valid_session
      end

      it "assigns the employee as @employee" do
        expect(assigns(:employee)).to eq(employee)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let! :employee do
      employee = Employee.create! valid_attributes
    end

    it "destroys the requested employee" do
      expect {
        delete :destroy, {:id => employee.to_param}, valid_session
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      delete :destroy, {:id => employee.to_param}, valid_session
      expect(response).to redirect_to(employees_url)
    end
  end
end
