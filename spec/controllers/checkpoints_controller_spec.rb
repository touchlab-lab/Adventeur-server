require 'spec_helper'

describe CheckpointsController do

  # This should return the minimal set of attributes required to create a valid
  # Checkpoint. As you add validations to Checkpoint, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CheckpointsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all checkpoints as @checkpoints" do
      checkpoint = Checkpoint.create! valid_attributes
      get :index, {}, valid_session
      assigns(:checkpoints).should eq([checkpoint])
    end
  end

  describe "GET show" do
    it "assigns the requested checkpoint as @checkpoint" do
      checkpoint = Checkpoint.create! valid_attributes
      get :show, {:id => checkpoint.to_param}, valid_session
      assigns(:checkpoint).should eq(checkpoint)
    end
  end

  describe "GET new" do
    it "assigns a new checkpoint as @checkpoint" do
      get :new, {}, valid_session
      assigns(:checkpoint).should be_a_new(Checkpoint)
    end
  end

  describe "GET edit" do
    it "assigns the requested checkpoint as @checkpoint" do
      checkpoint = Checkpoint.create! valid_attributes
      get :edit, {:id => checkpoint.to_param}, valid_session
      assigns(:checkpoint).should eq(checkpoint)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Checkpoint" do
        expect {
          post :create, {:checkpoint => valid_attributes}, valid_session
        }.to change(Checkpoint, :count).by(1)
      end

      it "assigns a newly created checkpoint as @checkpoint" do
        post :create, {:checkpoint => valid_attributes}, valid_session
        assigns(:checkpoint).should be_a(Checkpoint)
        assigns(:checkpoint).should be_persisted
      end

      it "redirects to the created checkpoint" do
        post :create, {:checkpoint => valid_attributes}, valid_session
        response.should redirect_to(Checkpoint.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved checkpoint as @checkpoint" do
        # Trigger the behavior that occurs when invalid params are submitted
        Checkpoint.any_instance.stub(:save).and_return(false)
        post :create, {:checkpoint => {}}, valid_session
        assigns(:checkpoint).should be_a_new(Checkpoint)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Checkpoint.any_instance.stub(:save).and_return(false)
        post :create, {:checkpoint => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested checkpoint" do
        checkpoint = Checkpoint.create! valid_attributes
        # Assuming there are no other checkpoints in the database, this
        # specifies that the Checkpoint created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Checkpoint.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => checkpoint.to_param, :checkpoint => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested checkpoint as @checkpoint" do
        checkpoint = Checkpoint.create! valid_attributes
        put :update, {:id => checkpoint.to_param, :checkpoint => valid_attributes}, valid_session
        assigns(:checkpoint).should eq(checkpoint)
      end

      it "redirects to the checkpoint" do
        checkpoint = Checkpoint.create! valid_attributes
        put :update, {:id => checkpoint.to_param, :checkpoint => valid_attributes}, valid_session
        response.should redirect_to(checkpoint)
      end
    end

    describe "with invalid params" do
      it "assigns the checkpoint as @checkpoint" do
        checkpoint = Checkpoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Checkpoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => checkpoint.to_param, :checkpoint => {}}, valid_session
        assigns(:checkpoint).should eq(checkpoint)
      end

      it "re-renders the 'edit' template" do
        checkpoint = Checkpoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Checkpoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => checkpoint.to_param, :checkpoint => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested checkpoint" do
      checkpoint = Checkpoint.create! valid_attributes
      expect {
        delete :destroy, {:id => checkpoint.to_param}, valid_session
      }.to change(Checkpoint, :count).by(-1)
    end

    it "redirects to the checkpoints list" do
      checkpoint = Checkpoint.create! valid_attributes
      delete :destroy, {:id => checkpoint.to_param}, valid_session
      response.should redirect_to(checkpoints_url)
    end
  end

end
